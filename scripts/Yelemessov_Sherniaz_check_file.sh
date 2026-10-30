#!/bin/bash
# Check file existence - Sherniaz Yelemessov
[ -e "$1" ] && echo "Файл существует" || echo "Файла нет"
