#!/bin/sh

rsync --exclude='.git/' \
      --exclude='.tmux/' \
      --exclude='.gitmodules' \
      --exclude='bootstrap.sh' \
      -avL . ~
