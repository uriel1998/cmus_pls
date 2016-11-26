cmus_pls
========

A simple utility to convert standard .PLS playlists for CMus

by Steven Saus
 
CMus is located at http://cmus.sourceforge.net/

CMus is a console music player that can accept playlists.  Usually I use a 
heavier application for actually managing my music library and creating 
playlists - but I like lighter applications for actually just playing the
tunes.  

The playlist that CMus takes (at least as of v2.3.3, which is what I have, 
though it's up to 2.5...) is a simple flat file of fully qualified paths
to the music (located at /home/USER/.cmus/playlist.pl ).  This script converts
a PLS format playlist, strips all the extra out, and changes the playlist.

Note that CMus overwrites the playlist upon exit.  Which is fine for me...
but to avoid problems, the script detects that so you don't have unexpected
behavior.

First argument is a path to where the playlists are located;  if there is no
argument, the current directory is used.  This script OVERWRITES whatever
playlist is in ~/.cmus/playlist.pl

Updated with Lizzy support:  http://sourceforge.net/projects/lizzy/?source=dlp
Lizzy lets you use any type of playlist instead of just PLS formats
You should be able to use this as-is without Lizzy existing, you'll just be limited
to PLS conversion.  Please note that you must manually set lizzyroot in this script.

Updated because %20 is not needed in file line

Licensed under a Creative Commons BY-SA 3.0 Unported license
To view a copy of this license, visit http://creativecommons.org/licenses/by-sa/3.0/.
