set hive.exec.dynamic.partition.mode=nonstrict;
insert overwrite table eshadoop.weblog
partition(p_year, p_month, p_date, p_hour)
select
	datetime,
	ip,
	extension,
	response,
	agent,
	bytes,
	url,
	os,
	tags,
	substr(datetime, 1, 4),
	substr(datetime, 6, 2),
	substr(datetime, 9, 2),
	substr(datetime, 12, 2)
from eshadoop.weblog_stg;