#!/bin/bash

# Default dir to place the Certificate
DIR_SSL_CERT="./tls"
DIR_SSL_KEY="./tls"

SSLNAME="tls"
SSLDAYS=365

# Cleanup the folder
rm -rf $DIR_SSL_CERT/*
rm -rf $DIR_SSL_KEY/*

echo "Creating a new Certificate ..."
openssl req -x509 -nodes -newkey rsa:2048 -keyout $SSLNAME.key -out $SSLNAME.crt -days $SSLDAYS -config csr.conf 

# Make directory to place SSL Certificate if it doesn't exists
if [[ ! -d $DIR_SSL_KEY ]]; then
  sudo mkdir -p $DIR_SSL_KEY
fi

if [[ ! -d $DIR_SSL_CERT ]]; then
  sudo mkdir -p $DIR_SSL_CERT
fi

# Place SSL Certificate within defined path
mv $SSLNAME.key $DIR_SSL_KEY/$SSLNAME.key
mv $SSLNAME.crt $DIR_SSL_CERT/$SSLNAME.crt

# Build a container 
podman build -t tls:latest .
