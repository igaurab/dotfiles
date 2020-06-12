#!/bin/bash
###################################################################### 
#Copyright (C) 2019  Kris Occhipinti
#https://filmsbykris.com

#This program is free software: you can redistribute it and/or modify
#it under the terms of the GNU General Public License as published by
#the Free Software Foundation, either version 3 of the License, or
#(at your option) any later version.

#This program is distributed in the hope that it will be useful,
#but WITHOUT ANY WARRANTY; without even the implied warranty of
#MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#GNU General Public License for more details.

#You should have received a copy of the GNU General Public License
#along with this program.  If not, see <http://www.gnu.org/licenses/>.
###################################################################### 

sublist="$HOME/.ytsubs.lst"
oldest="$(date -d "1 week ago" +%s)"
vid_date="/tmp/ytdate.tmp"
tmplist="/tmp/ytid.lst"
thumbdir="/tmp/ytthumbs"
playlist="/tmp/ytplay.pls"
watched="$HOME/.ytsubs.watched"
touch $watched
q=22 #Video Quality
maxthumbs=100 #max number of thumbnails shown

#remove watched videos
cat $watched|while read id;do echo "removing $id";rm $thumbdir/*$id*;done

let count="$(ls $thumbdir|wc -l)"
echo "Current Video Count: $count"

if [ ! -f "$sublist" ]; 
then
  echo "https://www.youtube.com/user/metalx1000/videos" > "$sublist"
  clear
  echo "Please added user video urls of channels you sub to."
  echo "To add or change this in the future please run:"
  echo "$0 edit"
  echo ""
  echo "Please Press Enter to Continue"
  read
  edit
fi

function main(){
  echo "Welcome..."
  playvideos

  exit 0
}

function playvideos(){
  if [ "$count" -lt 1 ];
  then 
    notify-send -t 3000 "Youtube Subs" "No videos to play"   
    exit
  fi

  ls $thumbdir/*.jpg|tail -n $maxthumbs |sxiv -ito |while read f;
  do 
    basename $f;
  done|cut -d\. -f2|\
  sed 's|^|https://www.youtube.com/watch?v=|g' > "$playlist"
  #display title of each video
  (cat "$playlist"|while read v;do echo "=================$(youtube-dl -e "$v")=======================";done) &
  mpv --ytdl-format=$q --fs --playlist="$playlist"
  cat $playlist|cut -d\= -f2 >> $watched
  rm "$playlist"
}

function update(){
  echo "Update Dating List"
  #rm /tmp/ytthumbs/*
  get_list
  get_vid_info
  cleanup
}


#Get List of Video IDs
function get_list(){
  if [ -f $tmplist ];then rm "$tmplist";fi

  sort -u $sublist|shuf|while read sub
  do
    echo "Checking $sub..."
    wget -qO- "$sub"|\
      grep "ux-thumb-wrap"|\
      head|\
      cut -d\" -f4|\
      cut -d\= -f2 >> "$tmplist"
  done
}

function get_vid_info(){
  cat "$tmplist"|while read id
  do
    c=$(check_date $id)
    if [ "$c" = "true" ]
    then
      echo "$id"
      get_thumbs "$id"
    fi
  done
}

function get_thumbs(){
  mkdir -p "$thumbdir"
  #rm $thumbdir/*

  d="$(cat $vid_date)"
  wget -cq "https://i3.ytimg.com/vi/$1/hqdefault.jpg" -O "$thumbdir/$d.$1.jpg"
}

#check the video publish date
#if it's older then "$oldest" skip it
function check_date(){
    d="$(wget -qO- "https://www.youtube.com/watch?v=$1"|grep -i "datePublished"|cut -d\" -f4)"
    d="$(date -d "$d" +%s)"
    echo -n "$d" > "$vid_date"
    if [ "$d" -gt "$oldest" ];
    then 
      echo true
    fi
}


function cleanup(){
  rm "$tmplist"
  rm "$playlist"
}

#upgrades current copy of ytsub
function upgrade(){
  if [ -f "/tmp/ytsubs.sh" ]
  then
    rm /tmp/ytsubs.sh || exit 1
  fi

  cd /tmp/ || exit 1
  wget "https://gitlab.com/metalx1000/Youtube-Subs/raw/master/ytsubs.sh" || exit 1
  chmod +x /tmp/ytsubs.sh || exit 1
  mv /tmp/ytsubs.sh $0 ||(echo "Error...";exit 1) 
}

#help function
function h(){
  cat << EOF
    "====Uses===="
    
    #For help
      $0 help 

    #To edit you sub list
      $0 edit

    #To update Video List (put this in a cron job)
      $0 update

    #Normal Usage
      $0

        ====== Created By Kris Occhipinti =====
            ==== http://filmsbykris.com ====
                    = Source Code: =
      = https://gitlab.com/metalx1000/Youtube-Subs =
                  == License GPLv3 ==
= https://gitlab.com/metalx1000/Youtube-Subs/blob/master/LICENSE =
EOF
}

if [ "$1" = "update" ]
then
  update
elif [ "$1" = "install" ]
then
  echo "Attepmting to install $0 to /usr/local/bin"
  echo "root/sudo is needed"
  sudo cp -v $0 /usr/local/bin/
elif [ "$1" = "help" ]
then
  h
elif [ "$1" = "upgrade" ]
then
  upgrade
elif [ "$1" = "edit" ]
then
  $EDITOR "$sublist"
else
  main
fi

