# rtk1619_build
build env for rtk1619

## BUILD
  * docker build -t chihyinglin/rtk1619_build -f Dockerfile .
  
## USAGE
  * docker run -v <SRC CODE>:/mnt/data -it chihyinglin/build_rtk1619  bash /root/autorun.sh <UID> [NAME [CMD]]

## EXAMPLE
  * docker run -v ~/work/1619sdkrelease:/mnt/data -it chihyinglin/build_rtk1619 bash /root/autorun.sh `id -u`
  * docker run -v ~/work/1619sdkrelease:/mnt/data -it chihyinglin/build_rtk1619 bash /root/autorun.sh `id -u` cy
  * docker run -v ~/work/1619sdkrelease:/mnt/data -it chihyinglin/build_rtk1619 bash /root/autorun.sh `id -u` cy build
