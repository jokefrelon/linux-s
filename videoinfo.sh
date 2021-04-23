#!/bin/bash
CST_RED="\033[49;31m"
CST_GREEN="\033[49;32m"
CST_YELLOW="\033[49;33m"
CST_DARK_BLUE="\033[49;34m"
CST_PURPLE="\033[49;35m"
CST_LIGHT_BLUE="\033[49;36m"
CSP="\033[0m"

flm=`ls | grep mp4`
for vds in $flm
do
	bsif1=`ffmpeg -hide_banner -i $vds 2>&1 | grep Duration`
	bsif2=`ffmpeg -i $vds -hide_banner 2>&1 | grep yuv420p`
	videotm=`echo $bsif1 | awk '{print $2}' | sed 's/,//g'`
	bitrate=`echo $bsif1 | awk '{print $6 $7}'`
	if [[ ! `echo $bsif2 | grep '0:0(jpn)'` ]]
	then
		videore=`echo $bsif2 | awk '{print $10}' | sed 's/,//g'`
	else
		videore=`echo $bsif2 | awk '{print $12}'`
	fi
	size=`ls -alh $vds | awk '{print $5}'`
	printf "$CST_YELLOW%-32s$COLLOR_STOP  $CST_LIGHT_BLUE%-6s$CSP  $CST_GREEN%-11s$CSP  %-9s  $CST_PURPLE%-8s$CSP\n" $vds $size $videotm $videore $bitrate
done