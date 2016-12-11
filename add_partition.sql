ALTER TABLE rmaz_backups
ADD partition (
    when_done='2016-12-11T11:11:51.404513Z',
    tenant_id='72d02b02-8735-4d28-84f7-7d20b4d7585d')
LOCATION 's3://rmaz-backups/72d02b02-8735-4d28-84f7-7d20b4d7585d/2016-12-11T11:11:51.404513Z/'
