#!/bin/sh -l

##  _     _            _                          
## | |__ | |_   _  ___| |__   ___ _ __ _ __ _   _ 
## | '_ \| | | | |/ _ \ '_ \ / _ \ '__| '__| | | |
## | |_) | | |_| |  __/ |_) |  __/ |  | |  | |_| |
## |_.__/|_|\__,_|\___|_.__/ \___|_|  |_|   \__, |
##                                          |___/ 
##
## ./main.sh       <javier.rios-urbano@epitech.eu>
##

check.sh $(pwd) $(pwd) > /dev/null
deno run --allow-read --allow-env sources/checker.ts
