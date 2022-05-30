#!/bin/bash

cd site1 
docker image build -t localhost:5000/site1 .
docker push localhost:5000/site1
cd ..

cd site2 
docker image build -t localhost:5000/site2 .
docker push localhost:5000/site2
cd ..
