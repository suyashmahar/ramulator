#!/usr/bin/env bash
./generate-random-trace.py 200000 >> temp.prefix
./generate-random-trace.py 200000 >> temp.suffix

trace_prefix="rnd_pd_pu_trace"
trace_suffix="trace"

for i in {1..10}; do
	printf "0x000000%02X NOP\n" "${i}"
	filename="${trace_prefix}${i}.${trace_suffix}"
	cat temp.prefix >> "${filename}"
	echo "0x00000000 PD_F_ACT" >> "${filename}"
	printf "0x000000%02X NOP\n" "$((i*100))" >> "${filename}"
	echo "0x00000000 PU_ACT" >> "${filename}"
	cat temp.suffix >> "${filename}"
done
