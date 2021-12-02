#!/bin/bash

NOCOLOR='\033[0m'
RED='\033[0;31m'
GREEN='\033[0;32m'
LIGHTGRAY='\033[0;37m'
YELLOW='\033[1;33m'
DARKGRAY='\033[1;30m'
WHITE='\033[1;37m'

PS_PATH="../push_swap/" # Путь до пушсвапа
CHECKER_PATH="./"
CHECKER_NAME="checker_mac"

printf "${GREEN}Testing push_swap\n\n${NOCOLOR}" >&1
##############################################
TotalNbTest=5
stack_size=5
##############################################
TOTAL=0
MAX=0
printf "${DARKGRAY} TEST FOR STACK SIZE 5\n\n${NOCOLOR}"
for ((testNB = 0; testNB < $TotalNbTest; testNB++)); do
	ARG=`./genstack.pl $stack_size -1000 1000` ;
	"./$PS_PATH/push_swap" $ARG > push_swap_result.txt ;
	RESULT_CHECKER=`"./$CHECKER_PATH/$CHECKER_NAME" $ARG < push_swap_result.txt`
	if [[ "$RESULT_CHECKER" = "KO" ]]; then
		printf "${RED}$RESULT_CHECKER\n $ARG\n ${NOCOLOR}"
	else
		printf "${GREEN}$RESULT_CHECKER ${NOCOLOR}"
	fi
	MOVES=` cat push_swap_result.txt | wc -l`
	#printf "${YELLOW} $MOVES ${NOCOLOR} instructions\n"
	TOTAL=$(( $TOTAL + $MOVES ))
	if (( $MAX < $MOVES )); then
		MAX=$(( $MOVES ))
	fi
done
printf "\n"
MEAN=$(( $TOTAL / $TotalNbTest ))
printf "\n${YELLOW}MAX: $MAX  ${WHITE}Mean: $MEAN ${DARKGRAY}for stack of size ${LIGHTGRAY}$stack_size \n\n"

############################################################
TotalNbTest=10
stack_size=100
############################################################
TOTAL=0
MAX=0
printf "${DARKGRAY} TEST FOR STACK SIZE 100\n\n${NOCOLOR}"
for ((testNB = 0; testNB < $TotalNbTest; testNB++)); do
	ARG=`./genstack.pl $stack_size -1000 1000` ;
	"./$PS_PATH/push_swap" $ARG > push_swap_result.txt ;
	RESULT_CHECKER=`"./$CHECKER_PATH/$CHECKER_NAME" $ARG < push_swap_result.txt`
	if [[ "$RESULT_CHECKER" = "KO" ]]; then
		printf "${RED}$RESULT_CHECKER\n $ARG\n ${NOCOLOR}"
	else
		printf "${GREEN}$RESULT_CHECKER ${NOCOLOR}"
	fi
	MOVES=` cat push_swap_result.txt | wc -l`
	#printf "${YELLOW} $MOVES ${NOCOLOR} instructions\n"
	TOTAL=$(( $TOTAL + $MOVES ))
	if (( $MAX < $MOVES )); then
		MAX=$(( $MOVES ))
	fi
done
printf "\n"
MEAN=$(( $TOTAL / $TotalNbTest ))
printf "\n${YELLOW}MAX: $MAX  ${WHITE}Mean: $MEAN ${DARKGRAY}for stack of size ${LIGHTGRAY}$stack_size \n\n"

###############################################################
TotalNbTest=3
stack_size=500
##############################################################
TOTAL=0
MAX=0
printf "${DARKGRAY} TEST FOR STACK SIZE 500\n\n${NOCOLOR}"
for ((testNB = 0; testNB < $TotalNbTest; testNB++)); do
	ARG=`./genstack.pl $stack_size -1000 1000` ;
	"./$PS_PATH/push_swap" $ARG > push_swap_result.txt ;
	RESULT_CHECKER=`"./$CHECKER_PATH/$CHECKER_NAME" $ARG < push_swap_result.txt`
	if [[ "$RESULT_CHECKER" = "KO" ]]; then
		printf "${RED}$RESULT_CHECKER\n $ARG\n ${NOCOLOR}"
	else
		printf "${GREEN}$RESULT_CHECKER ${NOCOLOR}"
	fi
	MOVES=` cat push_swap_result.txt | wc -l`
	#printf "${YELLOW} $MOVES ${NOCOLOR} instructions\n"
	TOTAL=$(( $TOTAL + $MOVES ))
	if (( $MAX < $MOVES )); then
		MAX=$(( $MOVES ))
	fi
done
printf "\n"
MEAN=$(( $TOTAL / $TotalNbTest ))
printf "\n${YELLOW}MAX: $MAX  ${WHITE}Mean: $MEAN ${DARKGRAY}for stack of size ${LIGHTGRAY}$stack_size \n\n"

#rm -f push_swap_result.txt