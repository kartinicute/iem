"""Days at or above temperature level"""
import datetime

import pandas as pd
from pandas.io.sql import read_sql
from pyiem.util import get_autoplot_context
from pyiem.network import Table as NetworkTable
import psycopg2


def get_description():
    """ Return a dict describing how to call this plotter """
    desc = dict()
    desc['data'] = True
    desc['description'] = """The generated plot presents a given's year total
    and the maximum number of days at or above a given high temperature
    threshold.
    """
    today = datetime.date.today()
    desc['arguments'] = [
        dict(type='station', name='station', default='IA2203',
             label='Select Station:', network='IACLIMATE'),
        dict(type="year", name="year", default=today.year,
             label="Year to Compare:"),
        ]
    return desc


def plotter(fdict):
    """ Go """
    import matplotlib
    matplotlib.use('agg')
    import matplotlib.pyplot as plt
    ctx = get_autoplot_context(fdict, get_description())
    station = ctx['station']
    nt = NetworkTable(ctx['network'])
    year = ctx['year']

    dbconn = psycopg2.connect(database='coop', host='iemdb', user='nobody')

    table = "alldata_%s" % (station[:2], )
    df = read_sql("""
        SELECT year, day, high from """ + table + """ WHERE
        station = %s and high is not null ORDER by day ASC
     """, dbconn, params=(station,), index_col='day')
    res = []
    for level in range(70, 106):
        gdf = df[df['high'] >= level].groupby('year').count()
        maxval = gdf.max()[0]
        label = ",".join([str(s) for s in
                          list(gdf[gdf['high'] == maxval].index.values)])
        thisyear = 0
        if year in gdf.index.values:
            thisyear = gdf.at[year, 'high']
        res.append(dict(level=level, label=label, max=maxval,
                        thisyear=thisyear))

    df = pd.DataFrame(res)
    df.set_index('level', inplace=True)

    (fig, ax) = plt.subplots(1, 1, figsize=(6, 8))
    ax.barh(df.index.values, df['max'].values,
            label="Max", zorder=2)
    ax.barh(df.index.values, df['thisyear'].values,
            label="%s" % (year,), zorder=3)
    for level, row in df.iterrows():
        ax.text(row['max'] + 1, level,
                "%s - %s" % (row['max'], row['label']), va='center')

    ax.grid(True, color='#EEEEEE', linewidth=1)
    ax.legend(loc='best')
    ax.set_xlim(0, df['max'].max() * 1.2)
    ax.set_ylim(69, 106)
    ax.set_title(("%s Maximum Days per Year\n"
                  "at or above given high temperature threshold"
                  ) % (nt.sts[station]['name'], ))
    ax.set_ylabel(r"High Temperature $^\circ%F")
    if year == datetime.date.today().year:
        ax.set_xlabel(("Days, %s data through %s"
                       ) % (year, datetime.date.today()))
    else:
        ax.set_xlabel("Days")

    return fig, df


if __name__ == '__main__':
    plotter(dict())
