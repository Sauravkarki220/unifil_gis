#! /usr/bin/env bash

mkdir out

echo "#pragma once" > out/symbols.h

echo "cmake_minimum_required(VERSION 3.21 FATAL_ERROR)" > out/CMakeLists.txt
echo "target_sources(pdfmaps" >> out/CMakeLists.txt
echo "" >> out/CMakeLists.txt
echo "    PRIVATE" >> out/CMakeLists.txt
    
for filename in ./*.png; do
	base_filename=$(basename "${filename%.*}")
	echo "Generating header & source for $base_filename..."
		
	echo "#pragma once" > out/${base_filename}.h
	echo "extern unsigned char ${base_filename}[];" >> out/${base_filename}.h
	echo "extern unsigned int ${base_filename}_len;" >> out/${base_filename}.h
	
	
	echo "#include \"${base_filename}.h\"" > out/${base_filename}.cpp
	xxd -n $base_filename -i $filename >> out/${base_filename}.cpp
	
	echo "        ${base_filename}.cpp" >> out/CMakeLists.txt
	echo "        ${base_filename}.h" >> out/CMakeLists.txt

	echo "#include \"${base_filename}.h\"" >> out/symbols.h
done	

echo ")" >> out/CMakeLists.txt
