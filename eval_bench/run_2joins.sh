#!/bin/sh

for s in 10 40 50 100 150 200 500
do
	python gen_2joins.py $s > gen_2joins.sql
	createdb q5tmp
	psql q5tmp < gen_2joins.sql
	psql q5tmp < setup.sql
	psql q5tmp < query_2joins.sql | tail -n 1 >> out5.data
	dropdb q5tmp
done
