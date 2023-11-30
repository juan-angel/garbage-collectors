#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Please, specify the number of the GC you want to use as argument:"
    echo "1) Serial"
    echo "2) Parallel"
    echo "3) G1"
    echo "4) Z"
else
	case $1 in
		1)
			GC="Serial"
		;;
		2)
			GC="Parallel"
		;;
		3)
			GC="G1"
		;;
		4)
			GC="Z"
		;;
		*)
			echo "Unsupported option $1"
			exit
		;;
	esac
	
	java -XX:+Use${GC}GC -XX:+PrintCommandLineFlags -cp target/garbage-collectors-0.0.1-SNAPSHOT.jar com.ing.jangel.garbagecollectors.MainSingleThread
	
	if [ $? -ne 0 ]; then
    	echo "java is not present in your path"
    fi
fi
