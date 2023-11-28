#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Please, specify the number of the GC you want to use as argument:"
    echo "1) Serial"
    echo "2) Parallel"
else
	case $1 in
		1)
			GC="Serial"
		;;
		*)
			GC="Parallel"
		;;
	esac
	
	java -XX:+Use${GC}GC -XX:+PrintCommandLineFlags -cp build/classes com.ing.jangel.garbagecollectors.Main
fi
