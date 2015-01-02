#!/bin/bash
rm {tmp,ranges}.txt

set -ev

while read link
	do
		curl -SsL "${link}" | gunzip -c | grep -v '#' | sed '/^$/d' | sed 's/.*://' >> tmp.txt
	done < links.txt

while read range
	do
		ipcalc --range ${range} | grep -v 'deaggregate' >> ranges.txt
	done < tmp.txt
rm tmp.txt