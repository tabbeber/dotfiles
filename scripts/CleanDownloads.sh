#!/bin/bash
find $HOME/Downloads/ -type d,f -mtime +14 -delete
