insert overwrite table eshadoop.applog_stg
select
	datetime,
	ip,
	extension,
	response,
	agent,
	bytes,
	url,
	os,
	tags
from eshadoop.applog
where p_year = '2015'
    and p_month = '05'
    and p_date = '18';
