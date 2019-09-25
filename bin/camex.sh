DIR=`dirname $1`
cd $DIR
PREFIX=$1
if [ -f $1 ]; then
    PREFIX="selection"
fi
/usr/local/bin/exiftool -echo 'File Name,Clip Directory,Camera Aperture,Camera Aperture Type,Camera Format,Camera FPS,Camera Manufacturer,Camera Serial #,Camera Type,Codec Bitrate,Gamma Notes,ISO,Lens Type,Shutter,White Balance Tint' -p '${FileName},${Directory},${Aperture},${PictureMode},${Format},${VideoFrameRate},${Make},${InternalSerialNumber},${Model},${AvgBitrate},${FilmMode},${ISO},${LensInfo},${ShutterSpeed},${WhiteBalance}' $@ > $PREFIX-camera-metadata.csv