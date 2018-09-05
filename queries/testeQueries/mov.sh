#!/bin/bash
for (( ; ; ))
do
	for I in {1..8}
	do
		psql -d ufersa_vdb_1 -f up${I}.sql
		sleep 5
	done
done
