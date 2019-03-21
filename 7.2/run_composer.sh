#!/bin/bash

opts=$@
echo $opts
su composer -c "/bin/composer $opts"