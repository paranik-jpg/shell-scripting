#!/usr/bin/env bash
set -eo pipefail
IFS=$'\n\t'

add_a_user()
{
	USER=$1
	PASSWORD=$2
	shift; shift;
	COMMENTS=$@
	sudo useradd -c "${COMMENTS}" $USER
	if [ "$?" -ne "0" ]; then
		echo "Useradd failed"
		return 1
	fi
	echo "$PASSWORD" | sudo passwd --stdin "$USER"
	if [ "$?" -ne "0" ]; then
		echo "Setting password failed"
		return 2
	fi
	echo "Added user $USER ($COMMENTS) with pass $PASSWORD"
}

add_a_user shree letmein Shree Sahu from Blockbusters
ADDUSER_RETURN_CODE=$?
if [ "$ADDUSER_RETURN_CODE" -eq "1" ]; then
	echo "Something went wrong with useradd"
elif [ "$ADDUSER_RETURN_CODE" -eq "2" ]; then
	echo "Something went wrong with passwd"
else
	echo "Shree Sahu added to the system."
fi

cleanup() {
    rm -rf "$TMP_DIR"
}
trap cleanup EXIT INT TERM
