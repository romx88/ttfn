#!/bin/bash

iptables -t nat -F OUTPUT

echo "La redirection du trafic sortant a été annulée."
