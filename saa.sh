#!/bin/bash
#set -vx
#PObjective: Capture frames and assemble an animation.
#keys are P5T6
i=0
mkdir ~/Desktop/ani
bgin(){
	i=0
	cd ~/Desktop/ani
	rm *.jpeg
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

	if [ "$input" = "t" ]; then 
		play

		elif [ "$input" = "5" ]; then
		capture

		elif [ "$input" = "p" ]; then 
		send

		elif [ "$input" = "6" ]; then
		bgin

		else
		echo "something went wrong: $input"
		exit
	fi
done
