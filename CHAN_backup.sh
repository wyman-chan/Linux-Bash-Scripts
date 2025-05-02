#!/bin/bash

#The purpose of this bash script is copy all the files in a directory
# to a special folder called BACKUP_FILES in your home directory.
# The script should (1) first check if the BACKUP_FILES directory exists
# and if not, create it. Then (2) copy all the files 1 at a time and echo
# the copy command to the terminal. Finally (3) Run a function that prints
# out some information to the screen.

#The following execute would copy all the files in the TMP directory to
# BACKUP_FILES in the home directory.

# $./Kelley_backup.sh TMP/

#Part 1: Check if the directory BACKUP_FILES exits
#  in your home directory. If it does not exist create the directory
#  and echo "Created BACKUP_FILES in $HOME directory "
#  If directory exists, echo "Directory $HOME/BACKUP_FILES exists."
#  HINT: https://www.cyberciti.biz/faq/howto-check-if-a-directory-exists-in-a-bash-shellscript/

#  Note: you can use the $HOME variable in bash like this $HOME/BACKUP_FILES

if [ -d "BACKUP_FILES" ]; then
     echo "Directory $HOME/BACKUP_FILES exists."
else
     mkdir BACKUP_FILES
     echo "Created BACKUP_FILES in $HOME directory"
fi


#Part 2: Write a for loop that copies all the files of a directory into BACKUP_FILES
#  The directory needs to be specific as the first option after the script (see above).

#  Hint: see the script 'convert_html_to_php.sh' at:
#     https://ryanstutorials.net/bash-scripting-tutorial/bash-loops.php

for fn in $HOME/TMP/*; do
     cp -r "$fn" "$HOME/BACKUP_FILES/"
     echo "$fn copied to $HOME/BACKUP_FILES"
done

#Part 3: Create a function called print_info that
#   (1) Uses the ls command to output all the file information (option -al)
#       in $HOME/BACKUP_FILES to the screen.
#   (2) Runs the disk usage command on the same file to report total
#       kilobytes of all the files in the directory
#       For example $du -sh Music would report the total disk usage of all
#       the files in my Music directory:
#         $ du -sh Music
#         15G	Music
#   (3) Then run print_info


print_info() 
{
     echo "$(ls -al $HOME/BACKUP_FILES)"
     echo "$(du -sh ~/BACKUP_FILES)"
}
print_info

#####THE OUTPUT SHOULD BE SOMETHING LIKE THIS#####
# if TMP has 3 files, then

# $./Kelley_backup.sh TMP/

# should generate:

# Created BACKUP_FILES in /Users/kina directory
# TMP//my_ls.sh copied to /Users/kina/BACKUP_FILES
# TMP//pysh.py copied to /Users/kina/BACKUP_FILES
# TMP//while-count.sh copied to /Users/kina/BACKUP_FILES
# total 24
# drwxr-xr-x   5 kina  staff   160 Feb  7 20:51 .
# drwxr-xr-x+ 71 kina  staff  2272 Feb  7 20:51 ..
# -rwxr-xr-x   1 kina  staff   100 Feb  7 20:51 my_ls.sh
# -rwxr-xr-x   1 kina  staff   144 Feb  7 20:51 pysh.py
# -rwxr-xr-x   1 kina  staff   152 Feb  7 20:51 while-count.sh
#  12K	/Users/kina/BACKUP_FILES