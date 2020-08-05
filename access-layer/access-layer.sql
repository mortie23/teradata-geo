
-- Author:  Christopher Mortimer
-- Date:    2020-08-05
-- Desc:    Parsing a GeoJSON JSON file in native Teradata to ST_Geometry

-- Get the features and geography
REPLACE VIEW PRD_ADS_HWD_WDAPGRP_DB.GEO AS
SELECT
  A.ID_COL
  , A.OBJECTID
  , GeomFromGeoJSON(A.GEOMETRY_CHAR,0) AS GEOMETRY
FROM (
  SELECT 
    T.ID_COL
    , T.OBJECTID
    , T.SA1_MAIN16
    , T.MMM2019
    , T.SHAPE_Leng
    , T.SHAPE_Area
    , TRIM(TRAILING ' ' FROM T.GEOMETRY_CHAR) AS GEOMETRY_CHAR
  FROM 
    JSON_TABLE (
    ON PRD_ADS_HWD_WDAPGRP_DB.GEO_JSON_STAGING
    USING 
      ROWEXPR('$.features[*]')
      colexpr('[ 
        { "jsonpath" : "$.properties.OBJECTID","type" : "BIGINT"}
        , { "jsonpath" : "$.properties.SA1_MAIN16","type" : "BIGINT"}
        , { "jsonpath" : "$.properties.MMM2019","type" : "INTEGER"}
        , { "jsonpath" : "$.properties.SHAPE_Leng","type" : "FLOAT"}
        , { "jsonpath" : "$.properties.SHAPE_Area","type" : "FLOAT"}
        , { "jsonpath" : "$.geometry","type" : "CHAR(63000)"}
        ]'
      )
  ) AS T (
    ID_COL
    , OBJECTID
    , SA1_MAIN16
    , MMM2019
    , SHAPE_Leng
    , SHAPE_Area
    , GEOMETRY_CHAR
  )
) AS A
;
