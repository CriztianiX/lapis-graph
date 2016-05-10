#!/bin/bash

curl -XPOST 127.0.0.1:8080 -H "Content-Type: application/json" -d '
{
	"arguments" : {
	 "id" : 2
        },
	"query" : "query getUser($id: ID) {
  	  person(id: $id) {
    	    id
  	  }
	 }"
}'
