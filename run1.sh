#!/usr/bin/env bash

if ! command -v protoc &> /dev/null
then
    echo "protoc must be installed to run this script"
    exit 1
fi


# Define the output file for the binary descriptor set
#output_file="wiremock-data/grpc/all_descriptors.dsc"
#
## Define the root directory containing your .proto files
#root_directory="."
#
## Find all .proto files in the root_directory and its subdirectories
#proto_files=($(find "$root_directory" -name "*.proto"))
#
## Build the protoc command
#protoc_cmd="protoc --descriptor_set_out=$output_file "
#
## Add each .proto file to the protoc command
#for proto_file in "${proto_files[@]}"
#do
#  protoc_cmd="$protoc_cmd $proto_file"
#done
#
#
#echo $protoc_cmd>cmd.txt
## Run the protoc command to generate the binary descriptor set
#$protoc_cmd

protoc --include_source_info --include_imports --descriptor_set_out  wiremock-data/grpc/all_descriptors.dsc ExampleServices.proto --proto_path .
/Library/Java/JavaVirtualMachines/jdk-17.jdk/Contents/Home/bin/java -cp wiremock-standalone-3.2.0.jar:wiremock-grpc-extension-standalone-0.2.0.jar wiremock.Run --port 8080 --root-dir wiremock-data