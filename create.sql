CREATE EXTERNAL TABLE IF NOT EXISTS rmaz_backups (
  value array<string> 
) PARTITIONED BY (
  when_done string,
  tenant_id string 
)
ROW FORMAT SERDE 'org.openx.data.jsonserde.JsonSerDe'
WITH SERDEPROPERTIES (
  'serialization.format' = '1'
) LOCATION 's3://rmaz-backups/';
