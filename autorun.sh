echo "USAGE: docker run -v <SRC CODE>:/mnt/data -it chihyinglin/build_rtk1619  bash /root/autorun.sh <UID> [NAME]"
echo "EXAMPLE: docker run -v ~/work/latticework/git/1619sdkrelease:/mnt/data -it chihyinglin/build_rtk1619  bash /root/autorun.sh `id -u` cy"

if [ "$1" == "" ]
then
	echo "ERROR: No UID, exit!!"

else
	uid=$1
	
	#default user in Dockerfile
	ori_user="newuser"
	if [ "$2" == "" ]
	then
		user=$ori_user
	else
		user=$2
	fi
	
	echo "uid/username: " $uid $user 

	sudo usermod -l $user $ori_user
	sudo groupmod -n $user $ori_user

	sudo usermod -u $uid $user	
	sudo groupmod -g $uid $user
	
	sudo su $user -c "cd /mnt/data/OpenWRT-LEDE && source ./build.sh"
fi

