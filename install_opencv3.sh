# Update packages
sudo apt-get update
sudo apt-get upgrade

# Remove any previous installations of x264
sudo apt-get remove x264 libx264-dev

# Install dependencies
sudo apt-get install build-essential checkinstall cmake pkg-config yasm gfortran git
sudo apt-get install libjpeg8-dev libjasper-dev libpng12-dev
# If you are using Ubuntu 14.04
sudo apt-get install libtiff4-dev
# If you are using Ubuntu 16.04
sudo apt-get install libtiff5-dev
sudo apt-get install libavcodec-dev libavformat-dev libswscale-dev libdc1394-22-dev
sudo apt-get install libxine2-dev libv4l-dev
sudo apt-get install libgstreamer0.10-dev libgstreamer-plugins-base0.10-dev
sudo apt-get install libqt4-dev libgtk2.0-dev libtbb-dev
sudo apt-get install libatlas-base-dev
sudo apt-get install libfaac-dev libmp3lame-dev libtheora-dev
sudo apt-get install libvorbis-dev libxvidcore-dev
sudo apt-get install libopencore-amrnb-dev libopencore-amrwb-dev
sudo apt-get install x264 v4l-utils

# Install optional dependencies
sudo apt-get install libprotobuf-dev protobuf-compiler
sudo apt-get install libgoogle-glog-dev libgflags-dev
sudo apt-get install libgphoto2-dev libeigen3-dev libhdf5-dev doxygen


# Install Python libraries
sudo apt-get install python-dev python-pip python3-dev python3-pip
sudo -H pip2 install -U pip numpy
sudo -H pip3 install -U pip numpy
############ For Python 2 ############
sudo pip install numpy scipy matplotlib scikit-image scikit-learn ipython
######################################
############ For Python 3 ############
sudo pip3 install numpy scipy matplotlib scikit-image scikit-learn ipython
######################################

# Download OpenCV & OpenCV_contrib
# Download opencv 3.3.0
git clone https://github.com/opencv/opencv.git
cd opencv 
git checkout 3.3.0 
cd ..

# Download opencv_contrib 3.3.0
git clone https://github.com/opencv/opencv_contrib.git
cd opencv_contrib
git checkout 3.3.0
cd ..

# Compile & Install OpenCV with contrib modules
cd opencv
mkdir build
cd build

# Run Cmake
cmake -D CMAKE_BUILD_TYPE=RELEASE \
      -D CMAKE_INSTALL_PREFIX=/usr/local \
      -D INSTALL_C_EXAMPLES=ON \
      -D INSTALL_PYTHON_EXAMPLES=ON \
      -D WITH_TBB=ON \
      -D WITH_TIFF=ON\
      -D WITH_V4L=ON \
      -D WITH_QT=ON \
      -D WITH_OPENGL=ON \
      -D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib/modules \
      -D BUILD_EXAMPLES=ON ..

# find out number of CPU cores in your machine
# substitute 4 by output of nproc
make -j$(($(nproc)-4))
sudo make install
sudo sh -c 'echo "/usr/local/lib" >> /etc/ld.so.conf.d/opencv.conf'
sudo ldconfig