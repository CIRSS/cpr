#!/bin/bash

mkdir -p temp
cat inputs/file1.txt > temp/file2.txt
cat temp/file2.txt > outputs/file3.txt
