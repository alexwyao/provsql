#!/bin/sh

for s in 3000 4000 5000 
do
	python genquery4.py $s > q4simple.sql
	createdb q4tmp
	psql q4tmp < q4simple.sql
	psql q4tmp < setup.sql
	psql q4tmp < query4t.sql | tail -n 1 >> out.data
	dropdb q4tmp
done
