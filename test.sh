#!/bin/bash

curl -XPOST 127.0.0.1:9900 -H "Content-Type: application/json" -d '
{
	"arguments" : {
	 "id" : 2
        },
	"query" : "query getUser($id: ID) {
  	  person(id: $id) {
    	    id, name
  	  }
	 }"
}'
