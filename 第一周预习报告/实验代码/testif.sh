#!/bin/bash
# 如果第一个参数小于或等于10
if [ $1 -le 10 ]; then
  # 输出 "a<=10"
  echo "a<=10"
# 否则如果第一个参数小于或等于20
elif [ $1 -le 20 ]; then
  # 输出 "10<a<=20"
  echo "10<a<=20"
# 否则
else
  # 输出 "a>20"
  echo "a>20"
fi