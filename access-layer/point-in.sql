-- Author:  Christopher Mortimer
-- Date:    2020-08-05
-- Desc:    Find the polygon that a point is in

SELECT 
  POINT.ID_COL
  , POLY.OBJECTID
FROM 
  PRD_ADS_HWD_WDAPGRP_DB.GEO_POINTS POINT
INNER JOIN 
  PRD_ADS_HWD_WDAPGRP_DB.GEO POLY
ON 
  POINT.POINT_GEOMETRY.ST_WITHIN(POLY.GEOMETRY)= 1
;
