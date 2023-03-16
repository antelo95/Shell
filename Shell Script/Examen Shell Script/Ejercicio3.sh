#! /bin/bash
cat pedidos | grep -v '#' | cut -d';' -f1 | sort
