#!/bin/bash

echo "CREATE USER graph0 WITH PASSWORD 'qwe123';"
echo "CREATE DATABASE graph0 OWNER graph0;"

cd deps ; git clone https://github.com/bjornbytes/graphql-lua
cd graphql-lua ; sudo luarocks make
