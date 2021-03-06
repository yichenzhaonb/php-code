/****** Script for SelectTopNRows command from SSMS  ******/
SELECT vts.vendor_id, vendor_type_name = 
    STUFF((SELECT DISTINCT ' | ' + vt.vendor_type_name
           FROM planroomfrontierconst.dbo.vendor_types b 
		   join planroomfrontierconst.dbo.vendor_type vt on vt.vendor_type_id =  b .VENDOR_TYPE_ID
           WHERE b.vendor_id = vts.vendor_id 
          FOR XML PATH('')), 1, 2, ''),v.company_name
FROM planroomfrontierconst.dbo.vendor_types vts
join planroomfrontierconst.dbo.vendors v on v.vendor_id= vts.VENDOR_ID
GROUP BY vts.vendor_id,v.company_name

