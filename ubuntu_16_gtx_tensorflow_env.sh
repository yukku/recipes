sudo apt-get update
sudo apt-get upgrade
sudo apt-get install build-essential
sudo apt-get install openssh-server
sudo apt-get install fish
sudo apt-get install htop
sudo apt-get install vim


# install nvidia driver
sudo apt-get install mesa-utils
sudo apt-get install dkms
rsync -chavzP --stats milldev@10.16.25.238:~/Downloads/NVIDIA-Linux-x86_64-390.42.run ~/Downloads/
cd ~/Downloads/
sudo service lightdm stop
sudo sh NVIDIA-Linux-x86_64-390.42.run
sudo nvidia-xconfig
cat /proc/driver/nvidia/version
sudo reboot

# if problem still with nvidia-smi
# sudo apt-get remove nvidia*
# sudo add-apt-repository ppa:xorg-edgers/ppa
# sudo apt-get update
# sudo apt-get install nvidia-current
# Then install nvidia driver again

# install cuda
rsync -chavzP --stats milldev@10.16.25.238:~/Downloads/cuda_9.0.176_384.81_linux.run ~/Downloads/
cd ~/Downloads/
sudo service lightdm stop
echo -e "blacklist nouveau\nblacklist lbm-nouveau\noptions nouveau modeset=0\nalias nouveau off\nalias lbm-nouveau off\n" | sudo tee /etc/modprobe.d/blacklist-nouveau.conf
echo options nouveau modeset=0 | sudo tee -a /etc/modprobe.d/nouveau-kms.conf
sudo apt-get install linux-image-extra-virtual
sudo vim /etc/apt/sources.list # remove # or add lines deb-src
sudo apt-get update
sudo apt-get install linux-source
sudo apt-get source linux-image-$(uname -r)
sudo apt-get install linux-headers-$(uname -r)
sudo update-initramfs -u

sudo reboot
sudo service lightdm stop
sudo sh cuda_9.0.176_384.81_linux.run --override --no-opengl-lib
sudo service lightdm start

vim ~/.bashrc
export LD_LIBRARY_PATH=/usr/local/cuda-9.0/lib64:$LD_LIBRARY_PATH
export CUDA_HOME=/usr/local/cuda-9.0:$CUDA_HOME
export PATH=/usr/local/cuda-9.0/bin:$PATH
source ~/.bashrc
nvcc --version

# install cudnn
rsync -chavzP --stats milldev@10.16.25.238:~/Downloads/cudnn-9.0-linux-x64-v7.tgz ~/Downloads/
cd ~/Downloads/
tar -xzvf cudnn-9.0-linux-x64-v7.tgz
sudo cp cuda/include/cudnn.h /usr/local/cuda/include
sudo cp cuda/lib64/libcudnn* /usr/local/cuda/lib64
sudo chmod a+r /usr/local/cuda/include/cudnn.h


# install tensorflow env
sudo apt-get install python-pip python-dev python-virtualenv # for Python 2.7
sudo apt-get install python3-pip python3-dev python-virtualenv # for Python 3.n

pip install tensorflow-gpu
pip3 install tensorflow-gpu


# install opencv

#Remove any previous installations of x264</h3>
sudo apt-get remove x264 libx264-dev
 
#We will Install dependencies now
 
sudo apt-get install build-essential checkinstall cmake pkg-config yasm
sudo apt-get install git gfortran
sudo apt-get install libjpeg8-dev libjasper-dev libpng12-dev
 
# If you are using Ubuntu 14.04
sudo apt-get install libtiff4-dev
# If you are using Ubuntu 16.04
sudo apt-get install libtiff5-dev
 
sudo apt-get install libavcodec-dev libavformat-dev libswscale-dev libdc1394-22-dev
sudo apt-get install libxine2-dev libv4l-dev
sudo apt-get install libgstreamer0.10-dev libgstreamer-plugins-base0.10-dev
sudo apt-get install qt5-default libgtk2.0-dev libtbb-dev
sudo apt-get install libatlas-base-dev
sudo apt-get install libfaac-dev libmp3lame-dev libtheora-dev
sudo apt-get install libvorbis-dev libxvidcore-dev
sudo apt-get install libopencore-amrnb-dev libopencore-amrwb-dev
sudo apt-get install x264 v4l-utils
 
# Optional dependencies
sudo apt-get install libprotobuf-dev protobuf-compiler
sudo apt-get install libgoogle-glog-dev libgflags-dev
sudo apt-get install libgphoto2-dev libeigen3-dev libhdf5-dev doxygen

git clone https://github.com/opencv/opencv.git
cd opencv
git checkout 3.4.1
cd ..

git clone https://github.com/opencv/opencv_contrib.git
cd opencv_contrib
git checkout 3.4.1
cd ..

cd opencv
mkdir build
cd build

cmake -D CMAKE_BUILD_TYPE=RELEASE \
      -D CMAKE_INSTALL_PREFIX=/usr/local \
      -D INSTALL_C_EXAMPLES=ON \
      -D INSTALL_PYTHON_EXAMPLES=ON \
      -D WITH_TBB=ON \
      -D WITH_V4L=ON \
      -D WITH_QT=ON \
      -D WITH_OPENGL=ON \
      -D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib/modules \
      -D BUILD_EXAMPLES=ON ..



nproc

make -j4
sudo make install
sudo sh -c 'echo "/usr/local/lib" >> /etc/ld.so.conf.d/opencv.conf'
sudo ldconfig




