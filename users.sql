WITH t1 AS 

    (
      
      SELECT json_parse(t) AS obj,
      json_extract(t,'$["odata.type"]') AS odata,
      CAST(json_extract(t,'$["aad.isdeleted"]') AS BOOLEAN) as d,
      CAST(json_extract(t,'$["aad.issoftdeleted"]') AS BOOLEAN) as sd
      FROM rmaz_backups 
      CROSS JOIN UNNEST(value) AS x (t)
      WHERE when_done='2016-12-09T00:50:23.451819Z' AND 
            tenant_id='a5263d55-d959-4391-a162-594b1e5ec7d3'),
      
    users AS (
    
      SELECT json_extract(obj,'$.mailnickname')  as mailnickname FROM t1
      WHERE json_format(odata) = '"Microsoft.DirectoryServices.User"' 
      AND d IS NULL AND sd IS NULL)
       
 SELECT DISTINCT mailnickname FROM users
