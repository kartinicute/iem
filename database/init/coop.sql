CREATE EXTENSION postgis;

-- Boilerplate IEM schema_manager_version, the version gets incremented each
-- time we make an upgrade script
CREATE TABLE iem_schema_manager_version(
	version int,
	updated timestamptz);
INSERT into iem_schema_manager_version values (7, now());

---
--- Storage of climoweek
CREATE TABLE climoweek(
  sday char(4) UNIQUE,
  climoweek smallint
);
GRANT SELECT on climoweek to nobody,apache;

---
--- Storage of Hayhoe downscaled data
---
CREATE TABLE hayhoe_daily(
  model varchar(32),
  scenario varchar(8),
  station varchar(6),
  day date,
  high real,
  low real,
  precip real
);
GRANT SELECT on hayhoe_daily to nobody,apache;
CREATE INDEX hayhoe_daily_station_idx on hayhoe_daily(station);

CREATE TABLE nass_quickstats(
        source_desc varchar(60),
        sector_desc varchar(60),
        group_desc varchar(80),
        commodity_desc varchar(80),
        class_desc varchar(180),
        prodn_practice_desc varchar(180),
        util_practice_desc varchar(180),
        statisticcat_desc varchar(80),
        unit_desc varchar(60),
        agg_level_desc varchar(40),
        state_alpha varchar(2),
        asd_code smallint,
        county_ansi smallint,
        zip_5 int,
        watershed_code int,
        country_code smallint,
        year int,
        freq_desc varchar(30),
        begin_code int,
        end_code int,
        week_ending date,
        load_time timestamptz,
        value varchar(24),
        cv varchar(7),
        num_value real
);
GRANT SELECT on nass_quickstats to nobody,apache;


---
--- Temp table
---
CREATE TABLE alldata_tmp(
  station char(6),
  day date,
  high int,
  low int,
  precip real,
  snow real,
  sday char(4),
  year int,
  month smallint,
  snowd real,
  estimated boolean,
  narr_srad real,
  merra_srad real,
  merra_srad_cs real,
  hrrr_srad real
  );

---
--- Datastorage tables
---
CREATE TABLE alldata(
  station char(6),
  day date,
  high int,
  low int,
  precip real,
  snow real,
  sday char(4),
  year int,
  month smallint,
  snowd real,
  estimated boolean,
  narr_srad real,
  merra_srad real,
  merra_srad_cs real,
  hrrr_srad real
  );
GRANT select on alldata to nobody,apache;

 CREATE TABLE alldata_ak() inherits (alldata); 
 GRANT SELECT on alldata_ak to nobody,apache;
 CREATE TABLE alldata_al() inherits (alldata); 
 GRANT SELECT on alldata_al to nobody,apache;
 CREATE TABLE alldata_ar() inherits (alldata); 
 GRANT SELECT on alldata_ar to nobody,apache;
 CREATE TABLE alldata_az() inherits (alldata); 
 GRANT SELECT on alldata_az to nobody,apache;
 CREATE TABLE alldata_ca() inherits (alldata); 
 GRANT SELECT on alldata_ca to nobody,apache;
 CREATE TABLE alldata_co() inherits (alldata); 
 GRANT SELECT on alldata_co to nobody,apache;
 CREATE TABLE alldata_ct() inherits (alldata); 
 GRANT SELECT on alldata_ct to nobody,apache;
 CREATE TABLE alldata_de() inherits (alldata); 
 GRANT SELECT on alldata_de to nobody,apache;
 CREATE TABLE alldata_fl() inherits (alldata); 
 GRANT SELECT on alldata_fl to nobody,apache;
 CREATE TABLE alldata_ga() inherits (alldata); 
 GRANT SELECT on alldata_ga to nobody,apache;
 CREATE TABLE alldata_hi() inherits (alldata); 
 GRANT SELECT on alldata_hi to nobody,apache;
 CREATE TABLE alldata_ia() inherits (alldata); 
 GRANT SELECT on alldata_ia to nobody,apache,apiuser;
 CREATE TABLE alldata_id() inherits (alldata); 
 GRANT SELECT on alldata_id to nobody,apache;
 CREATE TABLE alldata_il() inherits (alldata); 
 GRANT SELECT on alldata_il to nobody,apache;
 CREATE TABLE alldata_in() inherits (alldata); 
 GRANT SELECT on alldata_in to nobody,apache;
 CREATE TABLE alldata_ks() inherits (alldata); 
 GRANT SELECT on alldata_ks to nobody,apache;
 CREATE TABLE alldata_ky() inherits (alldata); 
 GRANT SELECT on alldata_ky to nobody,apache;
 CREATE TABLE alldata_la() inherits (alldata); 
 GRANT SELECT on alldata_la to nobody,apache;
 CREATE TABLE alldata_ma() inherits (alldata); 
 GRANT SELECT on alldata_ma to nobody,apache;
 CREATE TABLE alldata_md() inherits (alldata); 
 GRANT SELECT on alldata_md to nobody,apache;
 CREATE TABLE alldata_me() inherits (alldata); 
 GRANT SELECT on alldata_me to nobody,apache;
 CREATE TABLE alldata_mi() inherits (alldata); 
 GRANT SELECT on alldata_mi to nobody,apache;
 CREATE TABLE alldata_mn() inherits (alldata); 
 GRANT SELECT on alldata_mn to nobody,apache;
 CREATE TABLE alldata_mo() inherits (alldata); 
 GRANT SELECT on alldata_mo to nobody,apache;
 CREATE TABLE alldata_ms() inherits (alldata); 
 GRANT SELECT on alldata_ms to nobody,apache;
 CREATE TABLE alldata_mt() inherits (alldata); 
 GRANT SELECT on alldata_mt to nobody,apache;
 CREATE TABLE alldata_nc() inherits (alldata); 
 GRANT SELECT on alldata_nc to nobody,apache;
 CREATE TABLE alldata_nd() inherits (alldata); 
 GRANT SELECT on alldata_nd to nobody,apache;
 CREATE TABLE alldata_ne() inherits (alldata); 
 GRANT SELECT on alldata_ne to nobody,apache;
 CREATE TABLE alldata_nh() inherits (alldata); 
 GRANT SELECT on alldata_nh to nobody,apache;
 CREATE TABLE alldata_nj() inherits (alldata); 
 GRANT SELECT on alldata_nj to nobody,apache;
 CREATE TABLE alldata_nm() inherits (alldata); 
 GRANT SELECT on alldata_nm to nobody,apache;
 CREATE TABLE alldata_nv() inherits (alldata); 
 GRANT SELECT on alldata_nv to nobody,apache;
 CREATE TABLE alldata_ny() inherits (alldata); 
 GRANT SELECT on alldata_ny to nobody,apache;
 CREATE TABLE alldata_oh() inherits (alldata); 
 GRANT SELECT on alldata_oh to nobody,apache;
 CREATE TABLE alldata_ok() inherits (alldata); 
 GRANT SELECT on alldata_ok to nobody,apache;
 CREATE TABLE alldata_or() inherits (alldata); 
 GRANT SELECT on alldata_or to nobody,apache;
 CREATE TABLE alldata_pa() inherits (alldata); 
 GRANT SELECT on alldata_pa to nobody,apache;
 CREATE TABLE alldata_ri() inherits (alldata); 
 GRANT SELECT on alldata_ri to nobody,apache;
 CREATE TABLE alldata_sc() inherits (alldata); 
 GRANT SELECT on alldata_sc to nobody,apache;
 CREATE TABLE alldata_sd() inherits (alldata); 
 GRANT SELECT on alldata_sd to nobody,apache;
 CREATE TABLE alldata_tn() inherits (alldata); 
 GRANT SELECT on alldata_tn to nobody,apache;
 CREATE TABLE alldata_tx() inherits (alldata); 
 GRANT SELECT on alldata_tx to nobody,apache;
 CREATE TABLE alldata_ut() inherits (alldata); 
 GRANT SELECT on alldata_ut to nobody,apache;
 CREATE TABLE alldata_va() inherits (alldata); 
 GRANT SELECT on alldata_va to nobody,apache;
 CREATE TABLE alldata_vt() inherits (alldata); 
 GRANT SELECT on alldata_vt to nobody,apache;
 CREATE TABLE alldata_wa() inherits (alldata); 
 GRANT SELECT on alldata_wa to nobody,apache;
 CREATE TABLE alldata_wi() inherits (alldata); 
 GRANT SELECT on alldata_wi to nobody,apache;
 CREATE TABLE alldata_wv() inherits (alldata); 
 GRANT SELECT on alldata_wv to nobody,apache;
 CREATE TABLE alldata_wy() inherits (alldata); 
 GRANT SELECT on alldata_wy to nobody,apache;

CREATE UNIQUE index alldata_AK_idx on alldata_AK(station, day);
    CREATE INDEX alldata_AK_day_idx on alldata_AK(day);
    CREATE INDEX alldata_AK_sday_idx on alldata_AK(sday);
    CREATE INDEX alldata_AK_stationid_idx on alldata_AK(station);
    CREATE INDEX alldata_AK_year_idx on alldata_AK(year);
  
CREATE UNIQUE index alldata_AL_idx on alldata_AL(station, day);
    CREATE INDEX alldata_AL_day_idx on alldata_AL(day);
    CREATE INDEX alldata_AL_sday_idx on alldata_AL(sday);
    CREATE INDEX alldata_AL_stationid_idx on alldata_AL(station);
    CREATE INDEX alldata_AL_year_idx on alldata_AL(year);
  
CREATE UNIQUE index alldata_AR_idx on alldata_AR(station, day);
    CREATE INDEX alldata_AR_day_idx on alldata_AR(day);
    CREATE INDEX alldata_AR_sday_idx on alldata_AR(sday);
    CREATE INDEX alldata_AR_stationid_idx on alldata_AR(station);
    CREATE INDEX alldata_AR_year_idx on alldata_AR(year);
  
CREATE UNIQUE index alldata_AZ_idx on alldata_AZ(station, day);
    CREATE INDEX alldata_AZ_day_idx on alldata_AZ(day);
    CREATE INDEX alldata_AZ_sday_idx on alldata_AZ(sday);
    CREATE INDEX alldata_AZ_stationid_idx on alldata_AZ(station);
    CREATE INDEX alldata_AZ_year_idx on alldata_AZ(year);
  
CREATE UNIQUE index alldata_CA_idx on alldata_CA(station, day);
    CREATE INDEX alldata_CA_day_idx on alldata_CA(day);
    CREATE INDEX alldata_CA_sday_idx on alldata_CA(sday);
    CREATE INDEX alldata_CA_stationid_idx on alldata_CA(station);
    CREATE INDEX alldata_CA_year_idx on alldata_CA(year);
  
CREATE UNIQUE index alldata_CO_idx on alldata_CO(station, day);
    CREATE INDEX alldata_CO_day_idx on alldata_CO(day);
    CREATE INDEX alldata_CO_sday_idx on alldata_CO(sday);
    CREATE INDEX alldata_CO_stationid_idx on alldata_CO(station);
    CREATE INDEX alldata_CO_year_idx on alldata_CO(year);
  
CREATE UNIQUE index alldata_CT_idx on alldata_CT(station, day);
    CREATE INDEX alldata_CT_day_idx on alldata_CT(day);
    CREATE INDEX alldata_CT_sday_idx on alldata_CT(sday);
    CREATE INDEX alldata_CT_stationid_idx on alldata_CT(station);
    CREATE INDEX alldata_CT_year_idx on alldata_CT(year);
  
CREATE UNIQUE index alldata_DE_idx on alldata_DE(station, day);
    CREATE INDEX alldata_DE_day_idx on alldata_DE(day);
    CREATE INDEX alldata_DE_sday_idx on alldata_DE(sday);
    CREATE INDEX alldata_DE_stationid_idx on alldata_DE(station);
    CREATE INDEX alldata_DE_year_idx on alldata_DE(year);
  
CREATE UNIQUE index alldata_FL_idx on alldata_FL(station, day);
    CREATE INDEX alldata_FL_day_idx on alldata_FL(day);
    CREATE INDEX alldata_FL_sday_idx on alldata_FL(sday);
    CREATE INDEX alldata_FL_stationid_idx on alldata_FL(station);
    CREATE INDEX alldata_FL_year_idx on alldata_FL(year);
  
CREATE UNIQUE index alldata_GA_idx on alldata_GA(station, day);
    CREATE INDEX alldata_GA_day_idx on alldata_GA(day);
    CREATE INDEX alldata_GA_sday_idx on alldata_GA(sday);
    CREATE INDEX alldata_GA_stationid_idx on alldata_GA(station);
    CREATE INDEX alldata_GA_year_idx on alldata_GA(year);
  
CREATE UNIQUE index alldata_HI_idx on alldata_HI(station, day);
    CREATE INDEX alldata_HI_day_idx on alldata_HI(day);
    CREATE INDEX alldata_HI_sday_idx on alldata_HI(sday);
    CREATE INDEX alldata_HI_stationid_idx on alldata_HI(station);
    CREATE INDEX alldata_HI_year_idx on alldata_HI(year);
  
CREATE UNIQUE index alldata_ID_idx on alldata_ID(station, day);
    CREATE INDEX alldata_ID_day_idx on alldata_ID(day);
    CREATE INDEX alldata_ID_sday_idx on alldata_ID(sday);
    CREATE INDEX alldata_ID_stationid_idx on alldata_ID(station);
    CREATE INDEX alldata_ID_year_idx on alldata_ID(year);
  
CREATE UNIQUE index alldata_LA_idx on alldata_LA(station, day);
    CREATE INDEX alldata_LA_day_idx on alldata_LA(day);
    CREATE INDEX alldata_LA_sday_idx on alldata_LA(sday);
    CREATE INDEX alldata_LA_stationid_idx on alldata_LA(station);
    CREATE INDEX alldata_LA_year_idx on alldata_LA(year);
  
CREATE UNIQUE index alldata_MA_idx on alldata_MA(station, day);
    CREATE INDEX alldata_MA_day_idx on alldata_MA(day);
    CREATE INDEX alldata_MA_sday_idx on alldata_MA(sday);
    CREATE INDEX alldata_MA_stationid_idx on alldata_MA(station);
    CREATE INDEX alldata_MA_year_idx on alldata_MA(year);
  
CREATE UNIQUE index alldata_MD_idx on alldata_MD(station, day);
    CREATE INDEX alldata_MD_day_idx on alldata_MD(day);
    CREATE INDEX alldata_MD_sday_idx on alldata_MD(sday);
    CREATE INDEX alldata_MD_stationid_idx on alldata_MD(station);
    CREATE INDEX alldata_MD_year_idx on alldata_MD(year);
  
CREATE UNIQUE index alldata_ME_idx on alldata_ME(station, day);
    CREATE INDEX alldata_ME_day_idx on alldata_ME(day);
    CREATE INDEX alldata_ME_sday_idx on alldata_ME(sday);
    CREATE INDEX alldata_ME_stationid_idx on alldata_ME(station);
    CREATE INDEX alldata_ME_year_idx on alldata_ME(year);
  
CREATE UNIQUE index alldata_MS_idx on alldata_MS(station, day);
    CREATE INDEX alldata_MS_day_idx on alldata_MS(day);
    CREATE INDEX alldata_MS_sday_idx on alldata_MS(sday);
    CREATE INDEX alldata_MS_stationid_idx on alldata_MS(station);
    CREATE INDEX alldata_MS_year_idx on alldata_MS(year);
  
CREATE UNIQUE index alldata_MT_idx on alldata_MT(station, day);
    CREATE INDEX alldata_MT_day_idx on alldata_MT(day);
    CREATE INDEX alldata_MT_sday_idx on alldata_MT(sday);
    CREATE INDEX alldata_MT_stationid_idx on alldata_MT(station);
    CREATE INDEX alldata_MT_year_idx on alldata_MT(year);
  
CREATE UNIQUE index alldata_NC_idx on alldata_NC(station, day);
    CREATE INDEX alldata_NC_day_idx on alldata_NC(day);
    CREATE INDEX alldata_NC_sday_idx on alldata_NC(sday);
    CREATE INDEX alldata_NC_stationid_idx on alldata_NC(station);
    CREATE INDEX alldata_NC_year_idx on alldata_NC(year);
  
CREATE UNIQUE index alldata_NH_idx on alldata_NH(station, day);
    CREATE INDEX alldata_NH_day_idx on alldata_NH(day);
    CREATE INDEX alldata_NH_sday_idx on alldata_NH(sday);
    CREATE INDEX alldata_NH_stationid_idx on alldata_NH(station);
    CREATE INDEX alldata_NH_year_idx on alldata_NH(year);
  
CREATE UNIQUE index alldata_NJ_idx on alldata_NJ(station, day);
    CREATE INDEX alldata_NJ_day_idx on alldata_NJ(day);
    CREATE INDEX alldata_NJ_sday_idx on alldata_NJ(sday);
    CREATE INDEX alldata_NJ_stationid_idx on alldata_NJ(station);
    CREATE INDEX alldata_NJ_year_idx on alldata_NJ(year);
  
CREATE UNIQUE index alldata_NM_idx on alldata_NM(station, day);
    CREATE INDEX alldata_NM_day_idx on alldata_NM(day);
    CREATE INDEX alldata_NM_sday_idx on alldata_NM(sday);
    CREATE INDEX alldata_NM_stationid_idx on alldata_NM(station);
    CREATE INDEX alldata_NM_year_idx on alldata_NM(year);
  
CREATE UNIQUE index alldata_NV_idx on alldata_NV(station, day);
    CREATE INDEX alldata_NV_day_idx on alldata_NV(day);
    CREATE INDEX alldata_NV_sday_idx on alldata_NV(sday);
    CREATE INDEX alldata_NV_stationid_idx on alldata_NV(station);
    CREATE INDEX alldata_NV_year_idx on alldata_NV(year);
  
CREATE UNIQUE index alldata_NY_idx on alldata_NY(station, day);
    CREATE INDEX alldata_NY_day_idx on alldata_NY(day);
    CREATE INDEX alldata_NY_sday_idx on alldata_NY(sday);
    CREATE INDEX alldata_NY_stationid_idx on alldata_NY(station);
    CREATE INDEX alldata_NY_year_idx on alldata_NY(year);
  
CREATE UNIQUE index alldata_OK_idx on alldata_OK(station, day);
    CREATE INDEX alldata_OK_day_idx on alldata_OK(day);
    CREATE INDEX alldata_OK_sday_idx on alldata_OK(sday);
    CREATE INDEX alldata_OK_stationid_idx on alldata_OK(station);
    CREATE INDEX alldata_OK_year_idx on alldata_OK(year);
  
CREATE UNIQUE index alldata_OR_idx on alldata_OR(station, day);
    CREATE INDEX alldata_OR_day_idx on alldata_OR(day);
    CREATE INDEX alldata_OR_sday_idx on alldata_OR(sday);
    CREATE INDEX alldata_OR_stationid_idx on alldata_OR(station);
    CREATE INDEX alldata_OR_year_idx on alldata_OR(year);
  
CREATE UNIQUE index alldata_PA_idx on alldata_PA(station, day);
    CREATE INDEX alldata_PA_day_idx on alldata_PA(day);
    CREATE INDEX alldata_PA_sday_idx on alldata_PA(sday);
    CREATE INDEX alldata_PA_stationid_idx on alldata_PA(station);
    CREATE INDEX alldata_PA_year_idx on alldata_PA(year);
  
CREATE UNIQUE index alldata_RI_idx on alldata_RI(station, day);
    CREATE INDEX alldata_RI_day_idx on alldata_RI(day);
    CREATE INDEX alldata_RI_sday_idx on alldata_RI(sday);
    CREATE INDEX alldata_RI_stationid_idx on alldata_RI(station);
    CREATE INDEX alldata_RI_year_idx on alldata_RI(year);
  
CREATE UNIQUE index alldata_SC_idx on alldata_SC(station, day);
    CREATE INDEX alldata_SC_day_idx on alldata_SC(day);
    CREATE INDEX alldata_SC_sday_idx on alldata_SC(sday);
    CREATE INDEX alldata_SC_stationid_idx on alldata_SC(station);
    CREATE INDEX alldata_SC_year_idx on alldata_SC(year);
  
CREATE UNIQUE index alldata_TN_idx on alldata_TN(station, day);
    CREATE INDEX alldata_TN_day_idx on alldata_TN(day);
    CREATE INDEX alldata_TN_sday_idx on alldata_TN(sday);
    CREATE INDEX alldata_TN_stationid_idx on alldata_TN(station);
    CREATE INDEX alldata_TN_year_idx on alldata_TN(year);
  
CREATE UNIQUE index alldata_TX_idx on alldata_TX(station, day);
    CREATE INDEX alldata_TX_day_idx on alldata_TX(day);
    CREATE INDEX alldata_TX_sday_idx on alldata_TX(sday);
    CREATE INDEX alldata_TX_stationid_idx on alldata_TX(station);
    CREATE INDEX alldata_TX_year_idx on alldata_TX(year);
  
CREATE UNIQUE index alldata_UT_idx on alldata_UT(station, day);
    CREATE INDEX alldata_UT_day_idx on alldata_UT(day);
    CREATE INDEX alldata_UT_sday_idx on alldata_UT(sday);
    CREATE INDEX alldata_UT_stationid_idx on alldata_UT(station);
    CREATE INDEX alldata_UT_year_idx on alldata_UT(year);
  
CREATE UNIQUE index alldata_VA_idx on alldata_VA(station, day);
    CREATE INDEX alldata_VA_day_idx on alldata_VA(day);
    CREATE INDEX alldata_VA_sday_idx on alldata_VA(sday);
    CREATE INDEX alldata_VA_stationid_idx on alldata_VA(station);
    CREATE INDEX alldata_VA_year_idx on alldata_VA(year);
  
CREATE UNIQUE index alldata_VT_idx on alldata_VT(station, day);
    CREATE INDEX alldata_VT_day_idx on alldata_VT(day);
    CREATE INDEX alldata_VT_sday_idx on alldata_VT(sday);
    CREATE INDEX alldata_VT_stationid_idx on alldata_VT(station);
    CREATE INDEX alldata_VT_year_idx on alldata_VT(year);
  
CREATE UNIQUE index alldata_WA_idx on alldata_WA(station, day);
    CREATE INDEX alldata_WA_day_idx on alldata_WA(day);
    CREATE INDEX alldata_WA_sday_idx on alldata_WA(sday);
    CREATE INDEX alldata_WA_stationid_idx on alldata_WA(station);
    CREATE INDEX alldata_WA_year_idx on alldata_WA(year);
  
CREATE UNIQUE index alldata_WV_idx on alldata_WV(station, day);
    CREATE INDEX alldata_WV_day_idx on alldata_WV(day);
    CREATE INDEX alldata_WV_sday_idx on alldata_WV(sday);
    CREATE INDEX alldata_WV_stationid_idx on alldata_WV(station);
    CREATE INDEX alldata_WV_year_idx on alldata_WV(year);
  
CREATE UNIQUE index alldata_WY_idx on alldata_WY(station, day);
    CREATE INDEX alldata_WY_day_idx on alldata_WY(day);
    CREATE INDEX alldata_WY_sday_idx on alldata_WY(sday);
    CREATE INDEX alldata_WY_stationid_idx on alldata_WY(station);
    CREATE INDEX alldata_WY_year_idx on alldata_WY(year);



CREATE TABLE alldata_estimates(
  station char(6),
  day date,
  high int,
  low int,
  precip real,
  snow real,
  sday char(4),
  year int,
  month smallint,
  snowd real,
  estimated boolean,
  narr_srad real,
  merra_srad real,
  merra_srad_cs real,
  hrrr_srad real
  );
GRANT select on alldata_estimates to nobody,apache;

---
--- Quasi synced from mesosite database
---
CREATE TABLE stations(
	id varchar(20),
	synop int,
	name varchar(64),
	state char(2),
	country char(2),
	elevation real,
	network varchar(20),
	online boolean,
	params varchar(300),
	county varchar(50),
	plot_name varchar(64),
	climate_site varchar(6),
	remote_id int,
	nwn_id int,
	spri smallint,
	wfo varchar(3),
	archive_begin timestamptz,
	archive_end timestamp with time zone,
	modified timestamp with time zone,
	tzname varchar(32),
	iemid SERIAL,
	metasite boolean,
	sigstage_low real,
	sigstage_action real,
	sigstage_bankfull real,
	sigstage_flood real,
	sigstage_moderate real,
	sigstage_major real,
	sigstage_record real,
	ugc_county char(6),
	ugc_zone char(6),
	ncdc81 varchar(11),
	temp24_hour smallint,
	precip24_hour smallint
);
CREATE UNIQUE index stations_idx on stations(id, network);
create UNIQUE index stations_iemid_idx on stations(iemid);
SELECT AddGeometryColumn('stations', 'geom', 4326, 'POINT', 2);
GRANT SELECT on stations to apache,nobody;
grant all on stations_iemid_seq to nobody,apache;
GRANT ALL on stations to mesonet,ldm;
GRANT ALL on stations_iemid_seq to mesonet,ldm;

---
--- Store the climate normals
---
CREATE TABLE climate(
  station varchar(6),
  valid date,
  high real,
  low real,
  precip real,
  snow real,
  max_high real,
  max_low real,
  min_high real,
  min_low real,
  max_precip real,
  years int,
  gdd32 real,
  gdd41 real,
  gdd46 real,
  gdd48 real,
  gdd50 real,
  gdd51 real,
  gdd52 real,
  sdd86 real,
  max_high_yr   int,
  max_low_yr    int,
  min_high_yr   int,
  min_low_yr    int,
  max_precip_yr int,
  max_range     smallint,
  min_range smallint,
  hdd65 real,
  cdd65 real,
  srad real
);
CREATE UNIQUE INDEX climate_idx on climate(station,valid);
GRANT SELECT on climate to nobody,apache;

CREATE TABLE climate51(
  station varchar(6),
  valid date,
  high real,
  low real,
  precip real,
  snow real,
  max_high real,
  max_low real,
  min_high real,
  min_low real,
  max_precip real,
  years int,
  gdd32 real,
  gdd41 real,
  gdd46 real,
  gdd48 real,
  gdd50 real,
  gdd51 real,
  gdd52 real,
  sdd86 real,
  max_high_yr   int,
  max_low_yr    int,
  min_high_yr   int,
  min_low_yr    int,
  max_precip_yr int,
  max_range     smallint,
  min_range smallint,
  hdd65 real,
  cdd65 real,
  srad real
);
CREATE UNIQUE INDEX climate51_idx on climate51(station,valid);
CREATE INDEX climate51_station_idx on climate51(station);
CREATE INDEX climate51_valid_idx on climate51(valid);
GRANT SELECT on climate51 to nobody,apache;

CREATE TABLE climate71(
  station varchar(6),
  valid date,
  high real,
  low real,
  precip real,
  snow real,
  max_high real,
  max_low real,
  min_high real,
  min_low real,
  max_precip real,
  years int,
  gdd32 real,
  gdd41 real,
  gdd46 real,
  gdd48 real,
  gdd50 real,
  gdd51 real,
  gdd52 real,
  sdd86 real,
  max_high_yr   int,
  max_low_yr    int,
  min_high_yr   int,
  min_low_yr    int,
  max_precip_yr int,
  max_range     smallint,
  min_range smallint,
  hdd65 real,
  cdd65 real,
  srad real
);
CREATE UNIQUE INDEX climate71_idx on climate71(station,valid);
GRANT SELECT on climate71 to nobody,apache;

CREATE TABLE ncdc_climate71(
  station varchar(6),
  valid date,
  high real,
  low real,
  precip real,
  snow real,
  max_high real,
  max_low real,
  min_high real,
  min_low real,
  max_precip real,
  years int,
  gdd50 real,
  sdd86 real,
  max_high_yr   int,
  max_low_yr    int,
  min_high_yr   int,
  min_low_yr    int,
  max_precip_yr int,
  max_range     smallint,
  min_range smallint,
  hdd65 real 
);
CREATE UNIQUE INDEX ncdc_climate71_idx on ncdc_climate71(station,valid);
GRANT SELECT on ncdc_climate71 to nobody,apache;

CREATE TABLE ncdc_climate81(
  station varchar(11),
  valid date,
  high real,
  low real,
  precip real 
);
CREATE UNIQUE INDEX ncdc_climate81_idx on ncdc_climate81(station,valid);
GRANT SELECT on ncdc_climate81 to nobody,apache;


CREATE TABLE climate81(
  station varchar(6),
  valid date,
  high real,
  low real,
  precip real,
  snow real,
  max_high real,
  max_low real,
  min_high real,
  min_low real,
  max_precip real,
  years int,
  gdd32 real,
  gdd41 real,
  gdd46 real,
  gdd48 real,
  gdd50 real,
  gdd51 real,
  gdd52 real,
  sdd86 real,
  max_high_yr   int,
  max_low_yr    int,
  min_high_yr   int,
  min_low_yr    int,
  max_precip_yr int,
  max_range     smallint,
  min_range smallint,
  hdd65 real,
  cdd65 real,
  srad real
);
CREATE UNIQUE INDEX climate81_idx on climate81(station,valid);
GRANT SELECT on climate81 to nobody,apache;

COPY climoweek (sday, climoweek) FROM stdin;
0101	44
0102	44
0103	45
0104	45
0105	45
0106	45
0107	45
0108	45
0109	45
0110	46
0111	46
0112	46
0113	46
0114	46
0115	46
0116	46
0117	47
0118	47
0119	47
0120	47
0121	47
0122	47
0123	47
0124	48
0125	48
0126	48
0127	48
0128	48
0129	48
0130	48
0131	49
0201	49
0202	49
0203	49
0204	49
0205	49
0206	49
0207	50
0208	50
0209	50
0210	50
0211	50
0212	50
0213	50
0214	51
0215	51
0216	51
0217	51
0218	51
0219	51
0220	51
0221	52
0222	52
0223	52
0224	52
0225	52
0226	52
0227	52
0228	53
0229	53
0301	1
0302	1
0303	1
0304	1
0305	1
0306	1
0307	1
0308	2
0309	2
0310	2
0311	2
0312	2
0313	2
0314	2
0315	3
0316	3
0317	3
0318	3
0319	3
0320	3
0321	3
0322	4
0323	4
0324	4
0325	4
0326	4
0327	4
0328	4
0329	5
0330	5
0331	5
0401	5
0402	5
0403	5
0404	5
0405	6
0406	6
0407	6
0408	6
0409	6
0410	6
0411	6
0412	7
0413	7
0414	7
0415	7
0416	7
0417	7
0418	7
0419	8
0420	8
0421	8
0422	8
0423	8
0424	8
0425	8
0426	9
0427	9
0428	9
0429	9
0430	9
0501	9
0502	9
0503	10
0504	10
0505	10
0506	10
0507	10
0508	10
0509	10
0510	11
0511	11
0512	11
0513	11
0514	11
0515	11
0516	11
0517	12
0518	12
0519	12
0520	12
0521	12
0522	12
0523	12
0524	13
0525	13
0526	13
0527	13
0528	13
0529	13
0530	13
0531	14
0601	14
0602	14
0603	14
0604	14
0605	14
0606	14
0607	15
0608	15
0609	15
0610	15
0611	15
0612	15
0613	15
0614	16
0615	16
0616	16
0617	16
0618	16
0619	16
0620	16
0621	17
0622	17
0623	17
0624	17
0625	17
0626	17
0627	17
0628	18
0629	18
0630	18
0701	18
0702	18
0703	18
0704	18
0705	19
0706	19
0707	19
0708	19
0709	19
0710	19
0711	19
0712	20
0713	20
0714	20
0715	20
0716	20
0717	20
0718	20
0719	21
0720	21
0721	21
0722	21
0723	21
0724	21
0725	21
0726	22
0727	22
0728	22
0729	22
0730	22
0731	22
0801	22
0802	23
0803	23
0804	23
0805	23
0806	23
0807	23
0808	23
0809	24
0810	24
0811	24
0812	24
0813	24
0814	24
0815	24
0816	25
0817	25
0818	25
0819	25
0820	25
0821	25
0822	25
0823	26
0824	26
0825	26
0826	26
0827	26
0828	26
0829	26
0830	27
0831	27
0901	27
0902	27
0903	27
0904	27
0905	27
0906	28
0907	28
0908	28
0909	28
0910	28
0911	28
0912	28
0913	29
0914	29
0915	29
0916	29
0917	29
0918	29
0919	29
0920	30
0921	30
0922	30
0923	30
0924	30
0925	30
0926	30
0927	31
0928	31
0929	31
0930	31
1001	31
1002	31
1003	31
1004	32
1005	32
1006	32
1007	32
1008	32
1009	32
1010	32
1011	33
1012	33
1013	33
1014	33
1015	33
1016	33
1017	33
1018	34
1019	34
1020	34
1021	34
1022	34
1023	34
1024	34
1025	35
1026	35
1027	35
1028	35
1029	35
1030	35
1031	35
1101	36
1102	36
1103	36
1104	36
1105	36
1106	36
1107	36
1108	37
1109	37
1110	37
1111	37
1112	37
1113	37
1114	37
1115	38
1116	38
1117	38
1118	38
1119	38
1120	38
1121	38
1122	39
1123	39
1124	39
1125	39
1126	39
1127	39
1128	39
1129	40
1130	40
1201	40
1202	40
1203	40
1204	40
1205	40
1206	41
1207	41
1208	41
1209	41
1210	41
1211	41
1212	41
1213	42
1214	42
1215	42
1216	42
1217	42
1218	42
1219	42
1220	43
1221	43
1222	43
1223	43
1224	43
1225	43
1226	43
1227	44
1228	44
1229	44
1230	44
1231	44
\.

-- Storage of Nino Data
CREATE TABLE elnino(
        monthdate date UNIQUE,
        anom_34 real,
        soi_3m real
);
GRANT SELECT on elnino to nobody,apache;

-- Storage of Point Extracted Forecast Data
CREATE TABLE forecast_inventory(
  id SERIAL UNIQUE,
  model varchar(32),
  modelts timestamptz
);
GRANT SELECT on forecast_inventory to nobody,apache;

CREATE TABLE alldata_forecast(
  modelid int REFERENCES forecast_inventory(id),
  station char(6),
  day date,
  high int,
  low int,
  precip real,
  srad real
);
GRANT SELECT on alldata_forecast to nobody,apache;
CREATE INDEX alldata_forecast_idx on alldata_forecast(station, day);

-- Storage of baseline yield forecast data
CREATE TABLE yieldfx_baseline(
  station varchar(24),
  valid date,
  radn real,
  maxt real,
  mint real,
  rain real,
  windspeed real,
  rh real);
GRANT SELECT on yieldfx_baseline to nobody,apache;
