#!/bin/sh

echo "roop-unleashed 安装中..."

mkdir -p $HOMEDIR/app
chown -R $USER:$USER $HOMEDIR/app

# 克隆 roop-unleashed 仓库 到 $HOMEDIR/app
git clone https://github.com/C0untFloyd/roop-unleashed.git $HOMEDIR/app

ls -la $HOMEDIR/app

# 替换 requirements.txt，使用 src/requirements.txt 替换 $HOMEDIR/app/requirements.txt
rm -f $HOMEDIR/app/requirements.txt
cp $HOMEDIR/$PROJECT_NAME/src/requirements.txt $HOMEDIR/app/requirements.txt

# 安装 requirements.txt 中的所有包
pip install -r $HOMEDIR/app/requirements.txt

echo "roop-unleashed 安装完成"

