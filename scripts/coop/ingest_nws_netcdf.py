"""Ingest the NWS provided netcdf file of COOP data"""
import netCDF4
import sys
import datetime
import numpy as np
from pandas.io.sql import read_sql
from pyiem.util import get_dbconn
COOP = get_dbconn('coop', user='mesonet')
ccursor = COOP.cursor()

fn = sys.argv[1]
station = sys.argv[2]
nc = netCDF4.Dataset(fn)

byear = nc.variables['byear'][:]
maxt = nc.variables['maxt'][:]
mint = nc.variables['mint'][:]
pcpn = nc.variables['pcpn'][:]
snow = nc.variables['snow'][:]
snwg = nc.variables['snwg'][:]

current = read_sql("""SELECT day, high, low, precip, snow, snowd from
    alldata_ia WHERE station = %s ORDER by day ASC
    """, COOP, params=(station,), index_col='day')


def convert(val, precision):
    if val < 0:
        return 0.0001
    if np.ma.is_masked(val) or np.isnan(val):
        return None
    return round(val, precision)

added = 0
for yr in range(byear, 2016):
    for mo in range(12):
        for dy in range(31):
            try:
                date = datetime.date(yr, mo + 1, dy + 1)
            except:
                continue
            high = maxt[yr-byear, mo, dy]
            if (np.ma.is_masked(high) or np.isnan(high) or
                    high < -100 or high > 150):
                high = None
            else:
                high = int(high)

            low = mint[yr-byear, mo, dy]
            if (np.ma.is_masked(low) or np.isnan(low) or
                    low < -100 or low > 150):
                low = None
            else:
                low = int(low)

            precip = convert(pcpn[yr-byear, mo, dy], 2)
            snowfall = convert(snow[yr-byear, mo, dy], 1)
            snowd = convert(snwg[yr-byear, mo, dy], 1)
            if all([a is None for a in [high, low, precip, snowfall, snowd]]):
                    continue
            if date not in current.index.values:
                sday = "%02i%02i" % (date.month, date.day)
                added += 1
                ccursor.execute("""INSERT into alldata_ia(station, day, high,
                low, precip, snow, sday, year, month, snowd) VALUES (%s,
                %s, %s, %s, %s, %s, %s, %s, %s, %s)
                """, (station, date, high, low, precip, snowfall,
                      sday, int(date.year), int(date.month), snowd))

print("added %s" % (added,))
nc.close()
ccursor.close()
COOP.commit()
