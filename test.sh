#!/bin/bash

curl -XPOST 127.0.0.1:9900 -H "Content-Type: application/json" -d '
{
  "operation_name": "getUser",
	"arguments" : {
	 "id" : 2
        },
	"query" : "query getUser($id: ID) {
  	  user(id: $id) {
    	    id, name
  	  }
	 }"
}'
