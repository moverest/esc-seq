#!/bin/bash

function launch_terminal() {
	pty_path_file="$1"
	$2 "$0 launch-client $pty_path_file" & > /dev/null 2>&1

	echo -n "Waiting for terminal to launch..."
	while ! test -e $pty_path_file; do
		sleep 1
	done
	echo " done."
	shell_pid=`cat $pty_path_file`
	rm $pty_path_file
	echo "Shell pid: $shell_pid"
	term=`readlink /proc/$shell_pid/fd/0`
	echo "Terminal file: $term"

	buffer=
	while echo -n '> '; read -r buffer; do
		echo -ne "$buffer" > $term
	done
}

function start() {
	pty_path_file="/tmp/pty_path_file_$RANDOM"
	launch_terminal $pty_path_file "$1"
}

function client() {
	pty_path_file="$1"
	echo $BASHPID > "$pty_path_file"
	sleep infinity
}

function usage() {
	echo "$0 start [terminal]"
	exit 1
}

case "$1" in
	start)
		start "$2"
		;;
	launch-client)
		client "$2"
		;;
	*)
		usage
		;;
esac

