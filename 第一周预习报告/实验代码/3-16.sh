#!/bin/bash
# 提示用户选择水果
echo "选择水果:"
# 使用select命令创建菜单
select fruit in "APPLE" "ORANGE" "BANANA"; do
  # 输出用户选择的水果
  echo "您选择了: $fruit"
  # 退出循环
  break
done