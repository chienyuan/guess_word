guess_word
==========

4 pics 1 word search app

Requirement
1. install aspell 
Redhat: 
  sudo yum install aspell 
  sudo yum install aspell-en 
Ubuntu: 
  sudo apt-get install aspell 
  sudo apt-get install aspell-en 

2. update shared library. 
  I got error about "Could not open library 'libaspell.so': libaspell.so: cannot open shared object file: No such file or directory"
  sudo ln /usr/lib64/libaspell.so.15.1.4 /usr/lib64/libaspell.so
