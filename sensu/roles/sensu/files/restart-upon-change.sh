confDir=/etc/sensu/conf.d
clientFile=${confDir}/client.json
oldClientFile=${confDir}/client-old-json


sumFile() {
	if [ -s "$1" ]
	then
		sum $1 | cut -f1 -d' '
	else
		echo 0
	fi
}

oldSum=`sumFile $oldClientFile`
newSum=`sumFile $clientFile`

if [ "$oldSum" != "$newSum" ]
then
	cp $clientFile  $oldClientFile
	service sensu-client restart
fi
