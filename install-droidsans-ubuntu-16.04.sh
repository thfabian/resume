#!/bin/bash

#
# Install the droidsans for Ubuntu 16.04
#

CWD=$(pwd)

# Download
rm -f $CWD/droid.zip
wget -4 http://mirrors.ctan.org/fonts/droid.zip

# Unzip
rm -rf $CWD/droid
unzip $CWD/droid.zip

# Copy doc/, fonts/, source/, and tex/ directories to your texmf/
TEXMF_DIR=/usr/share/texmf
sudo cp -r $CWD/droid/doc/ $TEXMF_DIR/
sudo cp -r $CWD/droid/fonts/ $TEXMF_DIR/
sudo cp -r $CWD/droid/source/ $TEXMF_DIR/
sudo cp -r $CWD/droid/tex/ $TEXMF_DIR/

# Run mktexlsr to refresh the file name database and make TEX aware f the new files.
sudo mktexlsr

# Run updmap to make Dvips, dvipdf and pdfTEX aware of the new fonts.
updmap --enable Map droid.map

# Cleanup
rm -f $CWD/droid.zip
rm -rf $CWD/droid

