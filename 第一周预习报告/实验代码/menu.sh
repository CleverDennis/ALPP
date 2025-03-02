#!/bin/bash
# 读取文件中的用户名
name=$(cat name 2>/dev/null)
# 当用户名不为 "cosmos" 时循环
while [ "$name" != "cosmos" ]; do
    # 显示输入框提示用户输入用户名
    dialog --inputbox "please input username" 10 30 2>name
    # 读取文件中的用户名
    name=$(cat name 2>/dev/null)
done
# 显示欢迎信息
dialog --msgbox "welcome to student infor System" 10 20

# 无限循环显示菜单
while true; do
    # 显示菜单并将选择结果保存到文件
    dialog --menu "Choose your operation:" 10 40 4 \
        1 "Add Student info" \
        2 "delete Student info" \
        3 "modify student information" \
        4 "exit" 2>menu.txt
    # 读取文件中的菜单选择结果
    menu=$(cat menu.txt 2>/dev/null)
    # 显示选择结果
    dialog --msgbox "your choose is $menu" 10 20
    
    # 如果选择4则退出循环
    if [ "$menu" -eq 4 ]; then
        exit 0
    fi
done