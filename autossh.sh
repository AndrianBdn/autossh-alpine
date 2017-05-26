#!/bin/sh 
autossh -M 20000 -N -o "ServerAliveInterval 30" -o "ServerAliveCountMax 3" $@ 
