#!/bin/bash
# https://drive.google.com/file/d/1dRtpI77Ds2RV7_dEjR6BmMyWkwB4C7U-/view
fileId=1dRtpI77Ds2RV7_dEjR6BmMyWkwB4C7U-
fileName=weights-370200.pt
curl -sc /tmp/cookie "https://drive.google.com/uc?export=download&id=${fileId}" > /dev/null
code="$(awk '/_warning_/ {print $NF}' /tmp/cookie)"  
curl -Lb /tmp/cookie "https://drive.google.com/uc?export=download&confirm=${code}&id=${fileId}" -o ${fileName} 