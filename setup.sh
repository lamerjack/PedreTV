sudo systemctl disable nodm
sudo apt-get install mpv python-dev samba
mkdir videos
sudo net usershare add videos /home/lab1/PedreTV/videos/ rutto libero everyone:F guest_ok=y
chmod 777 videos
git clone "https://github.com/duxingkei33/orangepi_PC_gpio_pyH3.git"
cd orangepi_PC_gpio_pyH3/
sudo python setup.py install
cd ..
