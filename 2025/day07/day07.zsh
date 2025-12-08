#!/bin/zsh

if [[ ! -t 0 ]] exec < input.txt

typeset -A MEMO
typeset -a lines
integer part1 part2 REPLY

function chase {
  local pos=$1 row=$2 key="$1:$2"

  if (( row >= $#lines )) { REPLY=0; return; }
  if (( $+MEMO[$key] ))   { REPLY=$MEMO[$key]; return }

  case ${${lines[row++]}[$pos]} in
  '.') chase $pos $row ;;
  '^') chase $((pos - 1)) $row
       integer tmp=$REPLY
       chase $((pos + 1)) $row
       let 'part1++' 'REPLY += tmp + 1' ;;
  esac
  MEMO[$key]=$REPLY
}

IFS=$'\n' read -Ad '' lines
start=${${lines[1]}[(i)S]}
shift lines

chase $start 1
part2=$(( REPLY + 1 ))
print $part1 $part2
