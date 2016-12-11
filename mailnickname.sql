select distinct 

    json_extract_scalar(v,'$.mailnickname') as mailnickname,
    json_extract_scalar(v,'$.userprincipalname') as upn

from rmaz_backups cross join unnest (value) as r(v) 

where tenant_id='a5263d55-d959-4391-a162-594b1e5ec7d3'
and json_extract_scalar(v,'$["odata.type"]')='Microsoft.DirectoryServices.User'

limit 20
