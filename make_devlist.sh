# this script generates the javascript source devlist.js
# and also caches the geocoding results into devlist.in
API_KEY="ABQIAAAAfoVs0Mc9jg7PYYEkvWKQ3hR-GX8CvEVVI1cqy6RU4TM3mlsc7xSFxqJl4TpEI1LGDJvvYEL2CplA-g"
SERVICE="http://maps.google.com/maps/geo"
cat > devlist.js <<END
function Contributor (name, address, role, lat, lon) {
  this.name = name;
  this.address = address;
  this.role = role;
  this.lat = lat;
  this.lon = lon;
}

function getContributorsList() {
  return [
END

echo -n > devlist.in.1

first=1
IFS=:
cat devlist.in | while read name address role latlong ; do
	echo -n -e "geocoding address \"$address\" ... "
	if [ -z "$latlong" ] ; then
		response=`wget "$SERVICE?q=$address&key=$API_KEY&sensor=false&output=csv&oe=utf8" -O - 2>/dev/null` || \
		{ echo wget failed! ; continue ; }
		sleep 1
		retcode=`echo $response | cut -d, -f1`
		if [ "$retcode" == 200 ] ; then
			latlong=`echo $response | cut -d, -f3,4`
			echo OK: $latlong
		else
			echo query failed !
			latlong="<failed query>"
		fi
	else
			echo FIXED: $latlong
	fi
	echo "$name:$address:$role:$latlong" >> devlist.in.1
	if (($first)) ; then
		first=0
	else
		echo -e "," >> devlist.js
	fi
	echo -n "    new Contributor(\"$name\", \"$address\", \"$role\", $latlong)" >> devlist.js
done
cat >> devlist.js <<END
  ];
}
END

if cmp -s devlist.in devlist.in.1 ; then
	rm devlist.in.1
else
	mv devlist.in.1 devlist.in
fi
