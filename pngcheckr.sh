#!/bin/bash
# ################################### #
# pngcheckr                           #
#                                     #
# pngcheck r(recursive) by m3 health. #
# ################################### #

# Get current working directory.
FILES="$( pwd )"

# Check to see if additional path information was provided, i.e. build/images/ vs source/images
if [ !!"$1" ]
then
  FILES+="/$1"
fi

# Verify that pngcheck utility exists. It can be downloaded at: http://sourceforge.net/projects/png-mng/files/pngcheck/2.3.0/
command -v pngcheck  >/dev/null 2>&1 || { echo "This script requires pngcheck to be installed - please verify that you have installed it or that your path is properly set. (Exiting... )" >&2; exit 1; }

echo -e "\n\nChecking for broken PNGs in $FILES ...\n///////////////////////////////"
for f in $(find $FILES -name '*.png')
do 
  echo "Checking $f ..."
  pngcheck -cv $f
  echo -e "\n"
done
echo "///////////////////////////////"