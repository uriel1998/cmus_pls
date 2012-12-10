#!/bin/bash

################################################################################
#  A simple utility to convert standard .PLS playlists for CMus
#
#  by Steven Saus
# 
#  CMus is located at http://cmus.sourceforge.net/
#
#  CMus is a console music player that can accept playlists.  Usually I use a 
#  heavier application for actually managing my music library and creating 
#  playlists - but I like lighter applications for actually just playing the
#  tunes.  
#
#  The playlist that CMus takes (at least as of v2.3.3, which is what I have, 
#  though it's up to 2.5...) is a simple flat file of fully qualified paths
#  to the music (located at /home/USER/.cmus/playlist.pl ).  This script converts
#  a PLS format playlist, strips all the extra out, and changes the playlist.
#
#  Note that CMus overwrites the playlist upon exit.  Which is fine for me...
#  but to avoid problems, the script detects that so you don't have unexpected
#  behavior.
#
#  Licensed under a Creative Commons BY-SA 3.0 Unported license
#  To view a copy of this license, visit http://creativecommons.org/licenses/by-sa/3.0/.
#
################################################################################


if [ -d "$1" ]; then
	playlistdir="$1"
else
	playlistdir=.
fi


isrunning=$(ps aux | grep cmus | awk '{print $11}' | grep cmus)

if [ "$isrunning" = "cmus" ]; then
	echo "###############################################################################"
	echo "Please exit CMUS before running this utility."
	echo "CMUS will overwrite any changes you make."
	echo "###############################################################################"	
else

fileList=$(find "$playlistdir" -maxdepth 1 -type f -iname "*.pls")
if [ "$filelist" = "" ]; then

	echo "###############################################################################"
	echo "Please specify the directory where your PLS format playlists are located:"
	echo " "
	echo "cmus_playlistgen.sh /PATH/TO/PLAYLISTS"
	echo " "
	echo "Or run this utility from the directory where they are located."
	echo "###############################################################################"	
else
	echo "###############################################################################"
	echo "Choose the playlist to convert to CMUS format."
	echo "Playlist will be written to ~/.cmus/playlist.pl"
	select fileName in $fileList; do
		    if [ -n "$fileName" ]; then
			name=$(basename "$fileName")
			grep $name -e "File" | awk -F "=" '{print $2}'
		    fi
		    break
		done
	echo "###############################################################################"		
	fi

fi
