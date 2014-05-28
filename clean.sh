#!/bin/bash -e

sudo chown -R $USER.$USER volumes/
rm -rf volumes/lib/*
rm volumes/log/error.log
