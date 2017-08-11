#!/bin/bash

if [ ! -d "$DEBOPS_HOME/ansible" ]; then
  debops-init $DEBOPS_HOME
fi

exec "$@"