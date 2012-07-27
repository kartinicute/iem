# Run every 10 minutes please
#set -x

cd current
python vsby.py
python today_precip.py
python today_gust.py
python temperature.py
python today_high.py
python rwis_station.py

cd ../summary
/mesonet/python/bin/python updateRain.py

cd ../delta
/mesonet/python/bin/python gen_15min.py

cd ../outgoing
php wxc_rwis.php
php wxc_awos.php
/mesonet/python/bin/python madis2csv.py
/mesonet/python/bin/python wxc_azos_prec.py
php spider.php
/mesonet/python/bin/python wxc_iarwis_traffic.py

cd kcci
/mesonet/python/bin/python wxc_top5.py
/mesonet/python/bin/python wxc_top5month.py
/mesonet/python/bin/python wxc_top5gusts.py
/mesonet/python/bin/python wxc_top5highs.py
/mesonet/python/bin/python wxc_top5lows.py

/mesonet/python/bin/python wxc_top5myrain.py 2
/mesonet/python/bin/python wxc_top5myrain.py 3
/mesonet/python/bin/python wxc_top5myrain.py 7
/mesonet/python/bin/python wxc_top5myrain.py 14
