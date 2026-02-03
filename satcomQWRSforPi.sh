#!/bin/bash
echo "UXW-QWRS/Satcom for Raspberry Pi"
echo "Copyright 2026 James Ervin"
echo "Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:"
echo "The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software."
echo "THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE."
echo ""
apt update --assume-yes
apt upgrade --assume-yes
apt install -f --assume-yes
apt install wsjtx -f --assume-yes
echo "WSJT-X install completed."
sleep 1
apt purge ^librtlsdr
rm -rvf /usr/lib/librtlsdr*
rm -rvf /usr/include/rtl-sdr*
rm -rvf /usr/local/lib/librtlsdr*
rm -rvf /usr/local/include/rtl-sdr*
rm -rvf /usr/local/include/rtl_*
rm -rvf /usr/local/bin/rtl_*
apt-get install libusb-1.0-0-dev git cmake pkg-config build-essential --assume-yes
git clone https://github.com/osmocom/rtl-sdr
cd rtl-sdr
mkdir build
cd build
cmake ../ -DINSTALL_UDEV_RULES=ON
make
make install
cp ../rtl-sdr.rules /etc/udev/rules.d/
ldconfig
echo 'blacklist dvb_usb_rtl28xxu' | sudo tee --append /etc/modprobe.d/blacklist-dvb_usb_rtl28xxu.conf
echo "RTL-SDR drivers installed."
sleep 1
wget -O thePackage.deb https://github.com/AlexandreRouma/SDRPlusPlus/releases/download/nightly/sdrpp_debian_trixie_aarch64.deb
apt install ./thePackage.deb -f --assume-yes
echo "SDR++ installed."
apt install pulseaudio -f --assume-yes
echo "PulseAudio installed."
apt install gpredict -f --assume-yes
sudo usermod -a -G dialout $USER
echo "Reboot your machine to finish installation of the RTL-SDR drivers & run rtl_test to test if the process worked."
