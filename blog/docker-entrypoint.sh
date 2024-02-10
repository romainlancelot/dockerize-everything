#!/bin/bash

echo "Waiting for postgres..."
sleep 10

diesel migration run
/app/blog/blog