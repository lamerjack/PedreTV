#!/bin/bash
if [ "$(id -u)" != "0" ]; then
echo "non sei root"
exit 1
fi
nomeunita=""
while [[ $nomeunita = "" ]]; do
read -e -p "Inserire il nome dell'unita': " -i "PedreTV" nomeunita
done
echo "unita' rinominata in: $nomeunita"

sed -i "s/$(cat /etc/hostname)/$nomeunita/g" /etc/hostname
sed -i "s/$(cat /etc/hostname)/$nomeunita/g" /etc/hostname

systemctl disable nodm
apt-get -y install mpv python-dev samba acpid
sh -c "echo event=button/power > /etc/acpi/events/button_power"
sh -c "echo action=/sbin/reboot >> /etc/acpi/events/button_power"

mkdir videos
net usershare add videos /home/lab1/PedreTV/videos/ rutto libero everyone:F guest_ok=y
chmod 777 videos
git clone "https://github.com/duxingkei33/orangepi_PC_gpio_pyH3.git"
cd orangepi_PC_gpio_pyH3/
python setup.py install
cd ..
perl -i -e '$/=undef; $_=<>; s/\n\n/\n\/home\/lab1\/PedreTV\/init.sh\n/; print $_' /etc/rc.local

apt -y upgrade
