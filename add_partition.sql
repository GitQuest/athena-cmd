ALTER TABLE rmaz_backups
ADD partition (
    when_done='2016-12-09T00:11:58.675973Z',
    tenant_id='a5263d55-d959-4391-a162-594b1e5ec7d3')
LOCATION 's3://rmaz-backups/a5263d55-d959-4391-a162-594b1e5ec7d3/2016-12-09T00:11:58.675973Z/'
