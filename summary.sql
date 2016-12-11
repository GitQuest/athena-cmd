WITH t1 AS 

    (
      
      SELECT json_parse(t) AS obj,
      json_extract(t,'$["odata.type"]') AS odata,
      CAST(json_extract(t,'$["aad.isdeleted"]') AS BOOLEAN) as d,
      CAST(json_extract(t,'$["aad.issoftdeleted"]') AS BOOLEAN) as sd
      FROM rmaz_backups 
      CROSS JOIN UNNEST(value) AS x (t)
      WHERE when_done='2016-12-11T11:11:51.404513Z' AND 
            tenant_id='72d02b02-8735-4d28-84f7-7d20b4d7585d'),
      
    links AS (
    
      SELECT COUNT(*) as links FROM t1
      WHERE json_format(odata) = '"Microsoft.DirectoryServices.DirectoryLinkChange"' 
      AND d IS NULL),
      
    deleted_links AS (
    
      SELECT COUNT(*) as deleted_links FROM t1
      WHERE json_format(odata) = '"Microsoft.DirectoryServices.DirectoryLinkChange"' 
      AND d),  
      
    contacts AS (
    
      SELECT COUNT(*) as contacts FROM t1
      WHERE json_format(odata) = '"Microsoft.DirectoryServices.Contact"' 
      AND d IS NULL),  
      
    deleted_contacts AS (
    
      SELECT COUNT(*) as deleted_contacts FROM t1
      WHERE json_format(odata) = '"Microsoft.DirectoryServices.Contact"' 
      AND d),     
    
    users AS (
    
      SELECT COUNT(*) as users FROM t1
      WHERE json_format(odata) = '"Microsoft.DirectoryServices.User"' 
      AND d IS NULL AND sd IS NULL),
      
    soft_deleted_users AS (
    
      SELECT COUNT(*) as soft_deleted_users FROM t1
      WHERE json_format(odata) = '"Microsoft.DirectoryServices.User"' 
      AND sd),  
      
    deleted_users AS (
    
      SELECT COUNT(*) as deleted_users FROM t1
      WHERE json_format(odata) = '"Microsoft.DirectoryServices.User"' 
      AND d),  
     
    groups AS (
    
      SELECT COUNT(*) as groups FROM t1
      WHERE json_format(odata) = '"Microsoft.DirectoryServices.Group"' 
      AND d IS NULL),
      
    deleted_groups AS (
    
      SELECT COUNT(*) as deleted_groups FROM t1
      WHERE json_format(odata) = '"Microsoft.DirectoryServices.Group"' 
      AND d),  
     
    summary AS (
       SELECT * FROM users 
       CROSS JOIN 
       links,
       deleted_links,
       contacts, 
       groups, 
       soft_deleted_users, 
       deleted_users, 
       deleted_groups, 
       deleted_contacts
       )
       
 SELECT * FROM summary
