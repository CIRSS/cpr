#!/bin/bash

# enter directory containing this script
cd `dirname $0`

date > outputs/date.txt
cat `pwd`/outputs/date.txt
