#!/bin/bash
#set -vx

i=0
mkdir ~/Desktop/ani
bgin(){
	i=0
	cd ~/Desktop/ani
	rm *.jpeg
	}

capture(){
	cd ~/Desktop/ani
	streamer -c /dev/video0 -s 800x600 -o outfile$i.jpeg
	let i++
	}	
	
play(){
	cd  ~/Desktop/ani
	M=$(date).gif
	convert	-delay 20 -loop 0 *.jpeg $M
	rm *.jpeg
	animate -loop 0 $M
	}
	
send(){
	mv $M ~/Desktop/ani/server
	echo "Your Image is at: http://server$M"
	}


while true; do
#clear
echo "s = capture, w = start over, a= play, d = send"
read -rsn1 input

	if [ "$input" = "a" ]; then 
		play

		elif [ "$input" = "s" ]; then
		capture

		elif [ "$input" = "d" ]; then 
		send

		elif [ "$input" = "w" ]; then
		bgin

		else
		echo "something went wrong: $input"
		exit
	fi
done

