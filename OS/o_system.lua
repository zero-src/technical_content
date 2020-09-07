--------------------------------------------------------------------------------
-- Lesson #001 | cmd usage | 04.09.2020
--------------------------------------------------------------------------------
1) doskey /history ["command history"]
2) ipconfig && mspaint ["multiply commands with using "&&" like in c++"]
3) ipconfig | clip [" "| clip" allows you to save command's output to your clipboard"]
4) sfc /scannow ["scan system files for problems w/o antivirus"]
5) ipconfig /flushdns ["fix issues with DNS resolver cache"]

-- Interfaces types
• GUI - graphic user interface 
• CLI - command-line interface

--------------------------------------------------------------------------------
-- https://opennet.ru/ | exploit documentation 
--------------------------------------------------------------------------------

-- Linux console commands
1) pwd ["returns current directory"]
2) cd: ["used for transfer"]
     • cd .. ["goes up to next directory"]
     • cd  ["returns home catalog"]
     • cd- ["goes to the previous catalog"]
3) ls: ["use for viewing content of selected directory"]
     • ls /home/Document
     • ls -R  ["reads content of the file"]
     • ls -a  ["shows hidden files of sub-directory"]
     • ls -al ["shows all information related to file"]
4) cat: ["short of concatenate [соединять]"]
     • cat > file ["creates new file"]
     • cat fl_1 fl_2 > fl_3 ["injects information from fl_1 and fl_2 into fl_3"]
     • cat filename | tr a-z A-Z >output.txt ["replaces all small letters with big one"]
5) cp image.jpg /home/gallery ["copies your image to the directory"]
6) mv: ["move"]
     • mv file.txt /home/folder ["moves your file to selected directory"]
     • mv old_name.txt new_name.txt ["renames selected file"]
7) mkdir: ["creates new directory"]
     • mkdir music/new_file ["generates new directory inside another directory"]
     • mkdir -p music/global/new_file ["creates directory between two existing directories"] ["new folder was named <global>"]
8) rmdir ["deletes directory"]
9) rm: ["deletes directory and contents within them"] ["NOTE: This will delete everything and there is no undo"]
     • rm -r ["similar to rmdir"]
10) touch: ["creates new blank file"]
     • touch /home/www/site/index.html ["creates an HTML file entitled index"]
11) locate: ["use it for searching files"]
     • locate -i useless*link ["-i indicates that user doesn't know full name of the file"] [" '*' concatenates two parts of the filename"]
12) find: ["using find also searches for files and directories"]
     • find /home/ -name notes.txt ["command will search for a file called notes.txt"]
     • find . -name notes.txt ["finds files in the current directory"]
     • / -type d -name notes. txt ["looks up for directions"]
13) grep ["it lets you search through all the text in a given file"] "grep blue notepad.txt"
14) sudo ["run as administrator"]
15) df: ["Use this command to get a report on the system’s disk space usage, shown in percentage and KBs"] 
     • df -m ["[-m] flag is used for converting KBs to MBs"]
16) du: ["Disk usage"]
     • du -h ["shows info in bytes, kilobytes, and megabytes"]
17) head: ["used to view the first lines of any text file"]
     • head -n x filename.txt ["if you only want to show the first x lines of file"]
18) tail: ["used to view the last ten lines of any text file"]
     • tail -n filename.ext ["if you only want to show the last x lines of file"]

--------------------------------------------------------------------------------
-- Useless links 
--------------------------------------------------------------------------------
1) qemu.org                     ["test your knolage of cmd"]
2) 9front.org                   ["useless shit"]
3) snow.org                     ["catalog of everything"]
4) cat-v.org                    ["probably useful"]
5) cocalc.com/doc/terminal.html ["Linux terminal online"]
