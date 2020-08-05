#!/usr/bin/python3

import geopandas

myshpfile = geopandas.read_file('/mnt/d/data/geo/modified-monash-model/MMM2019Final.shp')
myshpfile.to_file('mmm-2019-final.json', driver='GeoJSON')