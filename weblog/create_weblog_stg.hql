create external table eshadoop.weblog_stg (
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
STORED BY 'org.elasticsearch.hadoop.hive.EsStorageHandler'
TBLPROPERTIES (
  'es.nodes' = '127.0.0.1',
  'es.nodes.wan.only' = 'true',
  'es.resource' = 'weblog-2015.05.20/log',
  'es.query' = '?q=*',
  'es.index.auto.create' = 'no',
  'es.index.read.missing.as.empty' = 'yes',
  'es.field.read.empty.as.null' = 'yes',
	'es.mapping.date.rich' = 'false',
  'es.mapping.names' = '
		datetime:@timestamp,
		ip:ip,
	  extension:extension,
	  response:response,
	  agent:agent,
		bytes:bytes,
		url:url,
		os:machine.os,
		tags:@tags
  '
);