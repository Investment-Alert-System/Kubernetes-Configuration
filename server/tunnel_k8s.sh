#!/bin/bash

source .env

ssh -fNT -L 7821:127.0.0.1:8080 $SSH_USER@$BASTION_HOST