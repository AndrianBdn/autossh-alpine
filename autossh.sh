#!/bin/sh 
autossh -M 0 -N -o "ServerAliveInterval 30" -o "ServerAliveCountMax 3" $@ 
