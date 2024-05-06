#!/bin/bash

git clone git@github.com:ijapesigan/docker-mplusautomation.git
rm -rf "$PWD.git"
mv docker-mplusautomation/.git "$PWD"
rm -rf docker-mplusautomation
