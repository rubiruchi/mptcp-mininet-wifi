#!/bin/bash
SCHEDULER_BEFORE=$(cat /proc/sys/net/mptcp/mptcp_scheduler)
PATH_MANAGER_BEFORE=$(cat /proc/sys/net/mptcp/mptcp_path_manager)
if [[ "$1" == "" && "$1" == "" ]];then
	echo "Setting to default values"
	sudo sysctl net.mptcp.mptcp_scheduler=default
	sudo sysctl net.mptcp.mptcp_path_manager=default
	bash save_params.sh
elif [[ "$1" == "default" || "$1" == "redundant" || "$1" == "roundrobin" ]] && [[ "$2" == "default" || "$2" == "fullmesh" ]];then
	sudo sysctl net.mptcp.mptcp_scheduler=$1
	sudo sysctl net.mptcp.mptcp_path_manager=$2
	echo "Values saves correct: scheduler: $1 and path manager: $2 "
	bash save_params.sh
else
	echo "Setting to default values"
	echo "Check if your values is supported"
	sudo sysctl net.mptcp.mptcp_scheduler=default
	sudo sysctl net.mptcp.mptcp_path_manager=default
	bash save_params.sh
fi
