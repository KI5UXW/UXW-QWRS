#!/bin/bash
echo "KI5UXW's Quick WSPR Receiver Set-Up Removal(UXW-QWRS/R)"
echo "Copyright 2026 James Ervin"
echo "Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:"
echo "The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software."
echo "THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE."
sleep 1
apt update --assume-yes
apt upgrade --assume-yes
apt install -f --assume-yes
apt purge wsjtx --assume-yes
echo "WSJT-X removal completed."
sleep 1
apt purge ^librtlsdr
rm -rvf /usr/lib/librtlsdr*
rm -rvf /usr/include/rtl-sdr*
rm -rvf /usr/local/lib/librtlsdr*
rm -rvf /usr/local/include/rtl-sdr*
rm -rvf /usr/local/include/rtl_*
rm -rvf /usr/local/bin/rtl_*
rm -rvf ./rtl-sdr
echo "RTL-SDR driver removal completed."
apt purge sdrpp --assume-yes
echo "SDR++ removal completed."
apt purge pulseaudio* --assume-yes
echo "pulseaudio removal completed."
apt autoremove --assume-yes
echo "All unused dependencies removed."
