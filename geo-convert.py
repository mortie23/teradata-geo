#!/usr/bin/python3

import geopandas

myshpfile = geopandas.read_file('/mnt/d/data/geo/modified-monash-model/MMM2019Final.shp')
myshpfile.to_file('MMM2019Final.geojson', driver='GeoJSON')