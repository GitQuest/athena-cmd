ALTER TABLE rmaz_backups
ADD partition (
    when_done='2016-12-09T10:11:51.071052Z',
    tenant_id='62c532c8-6a84-46fc-a124-1cab1c44d131')
LOCATION 's3://rmaz-backups/62c532c8-6a84-46fc-a124-1cab1c44d131/2016-12-09T14:11:53.361352Z/'
