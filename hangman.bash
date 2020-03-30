#!bin/bash
clear
# ustawienie sciezki do pliku i pobranie ilosci linijek pliku
dicpl=./slowa.txt
lines=`wc -l < $dicpl`
# wykorzystanie polecenia shuf do pobrania losowej linijki ze slowem
word_number=`shuf -i 1-$lines -n 1`
# wykorzystanie polecenia sed to wyciagniecia slowa pod dana linijka
word=`sed "${word_number}q;d" $dicpl`
# zmienne sterujace
wrong_shoots=0
game_is_running=true
winner=false
good_letters=0
# tworzenie zamaskowanego slowa
game_word=()
for((i=0; i<${#word}; i++)); do
	game_word[$i]="_"
done

# funkcja ktore iteruje litery slowa i sprawdza czy zawiera ono typowana litere
function find_and_replace(){
	letter=$1
	founded=false
	for ((i=0; i<${#word}; i++)); do
		char=${word:$i:1}
		if [ $char == $letter ]; then
			game_word[$i]=$letter
			((founded=true))
			((good_letters=good_letters+1))
		fi
	done


	if [ $good_letters -eq ${#word} ]
	then
		((winner=1))
		((game_is_running=false))
	fi

	if [ $founded == false ]
	then
		((wrong_shoots=wrong_shoots+1))
	fi

}

# baner
function banner(){
	echo "*************************"
	echo "*       WISIELEC        *"
	echo "*************************"
}

function wrong0(){
	echo
	echo
	echo
	echo
	echo
	echo
	echo
	echo
}

function wrong1(){
    echo
    echo "        O             "
    echo
    echo
    echo
    echo
    echo
    echo
}
function wrong2(){
    echo
    echo "         O            "
    echo "         |            "
    echo
    echo
    echo
    echo
    echo
}
function wrong3(){
    echo
    echo "         O            "
    echo "         |\           "
    echo
    echo
    echo
    echo
    echo
}
function wrong4(){
    echo
    echo "         O            "
    echo "        /|\           "
    echo
    echo
    echo
    echo
    echo
}
function wrong5(){
    echo
    echo "         O            "
    echo "        /|\           "
    echo "        /             "
    echo
    echo
    echo
    echo
}
function wrong6(){
    echo
    echo "         O            "
    echo "        /|\           "
    echo "        / \           "
    echo
    echo
    echo
    echo
}
function wrong7(){
    echo
    echo "         __________   "
    echo "         |        |   "
    echo "         O        |   "
    echo "        /|\       |   "
    echo "        / \       |   "
    echo "    ______________|___"
    echo
}


function game_over(){
	clear
	echo "Przegrałeś"
	echo "Właściwym słowem było $word"
	read
	exit 0
}

function game_win(){
	clear
	echo "Wygrałeś"
	read
	exit 0
}

# glowna petla
function run(){
	wrong_shoots=0

	while [ $game_is_running == true ]
	do
		clear
		banner
		case $wrong_shoots in
			"0") wrong0;;
			"1") wrong1;;
			"2") wrong2;;
			"3") wrong3;;
			"4") wrong4;;
			"5") wrong5;;
			"6") wrong6;;
			"7") wrong7;;
		esac
		echo
		echo ${game_word[@]}
		echo "Pozostało prób: "$((7-wrong_shoots))
		if [ $wrong_shoots -eq 7 ]
		then
			((game_is_running=false))
		fi
		read user_letter
		find_and_replace $user_letter

	done


	if [ $winner -eq 1 ]
	then
		game_win
	else
		game_over
	fi
}

run
