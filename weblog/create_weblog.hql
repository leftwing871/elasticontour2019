set hive.exec.dynamic.partition.mode=nonstrict;
set hive.exec.dynamic.partition=true;
create external table if not exists eshadoop.weblog (
	datetime string,
	ip string,
	extension string,
	response string,
	agent string,
	bytes	bigint,
	url string,
	os string,
	tags array<string>
)
partitioned by (
  p_year string,
	p_month string,
	p_date string,
	p_hour string
)
stored as parquet
location "s3://eshadoop-demo/weblog";