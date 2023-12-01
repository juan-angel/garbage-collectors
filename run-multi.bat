@echo off

setlocal enabledelayedexpansion

IF "%#%" EQU "0" (
  echo "Please, specify the number of the GC you want to use as argument:"
  echo "1) Serial"
  echo "2) Parallel"
  echo "3) G1"
  echo "4) Z"
) ELSE (
  IF "%~1"=="1" (
    SET "GC=Serial"
  ) ELSE IF "%~1"=="2" (
    SET "GC=Parallel"
  ) ELSE IF "%~1"=="3" (
    SET "GC=G1"
  ) ELSE IF "%~1"=="4" (
    SET "GC=Z"
  ) ELSE (
    echo "Unsupported option %~1"
    exit
  )
  java "-XX:+Use!GC!GC" "-XX:+PrintCommandLineFlags" "-cp" "target/garbage-collectors-0.0.1-SNAPSHOT.jar" "com.ing.jangel.garbagecollectors.MainMultiThread"
  IF "%?%" NEQ "0" (
    echo "java is not present in your path"
  )
)
