select DISTINCT json_extract_scalar(v,'$.displayname')
from rmaz_backups cross join unnest (value) as r(v) limit 100
