#!/bin/bash
#Nick Potyok[2/16/19]

x=0

#------------------------------FUNCTIONS-------------------------------------------


#starts the gateway from the /opt/ttn-gateway/bin directory
function starter(){
cd /opt/ttn-gateway/bin
sudo ./start.sh
}


#Interafce to use/configure the basic packet forwarder
function forwarder(){
y=0
while [ $y = 0 ]
do
        clear
        figlet "Basic Packet Forwarder"
        echo
        cat /opt/ttn-gateway/packet_forwarder/basic_pkt_fwd/intro.txt
        echo "----------------"
        echo
        printf '\t1.) Start the basic packet forwarder\n'
        printf '\t2.) Display more info\n'
        printf '\t3.) Edit config files\n'
        printf '\t4.) Return to main menu\n'
        echo
read -p "----> " choice;

        case $choice in
                1)
                  cd /opt/ttn-gateway/packet_forwarder/basic_pkt_fwd
                  sudo ./basic_pkt_fwd
                ;;
                2)
                  clear screen
                  cd /opt/ttn-gateway/packet_forwarder/basic_pkt_fwd
                  cat readme.md
                  read -p "press enter to continue"
                ;;
                3)
                  echo "which file would you like to edit?"
                  echo $'1.) base64.c\n2.) basic_pkt_fwd.c\n3.) parson.c'
                  read -p "----> " option
                        if [ $option == 1 ]
                        then
                        sudo nano /opt/ttn-gateway/packet_forwarder/basic_pkt_fwd/src/base64.c
                        elif [ $option == 2 ]
                        then
			sudo nano /opt/ttn-gateway/packet_forwarder/basic_pkt_fwd/src/basic_pkt_fwd.c
                        elif [ $option == 3 ]
                        then
                        sudo nano /opt/ttn-gateway/packet_forwarder/basic_pkt_fwd/src/parson.c
                        fi
                	;;
                	4)y=1
			;;
        esac
done
}


#starts the util_pkt_logger
function logger(){
cd /opt/ttn-gateway/lora_gateway/util_pkt_logger
sudo ./util_pkt_logger
}


#Interface to use/configure beacon packet logger
function beacon(){

y=0
while [ $y = 0 ]
do
	clear
	figlet "Beacon Packet Forwarder"
	echo 
	cat /opt/ttn-gateway/packet_forwarder/beacon_pkt_fwd/intro.txt
	echo "----------------"
	echo 
	printf '\t1.) Start the beacon packet forwarder\n'
	printf '\t2.) Display more info\n'
	printf '\t3.) Edit config files\n'
	printf '\t4.) Return to main menu\n'
	echo 
read -p "----> " choice;

	case $choice in
		1)
		  cd /opt/ttn-gateway/packet_forwarder/beacon_pkt_fwd
		  sudo ./beacon_pkt_fwd
		;;
		2)
		  clear screen
		  cd /opt/ttn-gateway/packet_forwarder/beacon_pkt_fwd
		  cat readme.md
		  read -p "press enter to continue"
		;;
		3) 
		  echo "which file would you like to edit?"
		  echo $'1.) base64.c\n2.) beacon_pkt_fwd.c\n3.) parson.c'
		  read -p "----> " option
			if [ $option == 1 ]
			then
			sudo nano /opt/ttn-gateway/packet_forwarder/beacon_pkt_fwd/src/base64.c
			elif [ $option == 2 ]
			then
			sudo nano /opt/ttn-gateway/packet_forwarder/beacon_pkt_fwd/src/beacon_pkt_fwd.c
			elif [ $option == 3 ]
			then
			sudo nano /opt/ttn-gateway/packet_forwarder/beacon_pkt_fwd/src/parson.c
			fi
		;;
		4)y=1;;
	esac
done
}

#--------------------------------------MAIN_MENU---------------------------------
while [ $x = 0 ]
do
	clear
	figlet "JPCP Gateway"
	echo "------------------------------------------------------------"
	echo 
	echo 
	printf '\t1.) Run start.sh\n'
	printf '\t2.) Basic_pkt_fwd\n'
	printf '\t3.) Run util_pkt_logger\n'
	printf '\t4.) Beacon_pkt_fwd\n'
	printf '\t5.) Exit JPCP Gateway\n'
	echo 
read -p "----> " choice;

	case $choice in
		1)starter;;
		2)forwarder;;
		3)logger;;
		4)beacon;;
		5)x=1;;
	esac

done
