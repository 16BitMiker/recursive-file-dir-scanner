# Recursive File/Directory Scanner

## Program 1: Recursive File and Folder Scanner

### recursive-file-dir-scanner.pl

This Perl program is designed to recursively scan a given directory and provide size information for each file and folder within it. The program traverses through the directory tree, and outputs the size information using the built-in stat function.

The program takes no command-line arguments, the current directory is scanned. 

## Program 2: Bash One-Liner with Tree Command and Perl Cleanup

### recursive-file-dir-scanner.sh

This Bash one-liner utilizes the tree command to generate a tree-like structure of the files and folders within a given directory. The output of the tree command is then piped into a Perl command that filters out any unnecessary characters and formats the output into a more readable format.

The one-liner takes no command-line arguments, it scans the current directory. Once the program has completed the scan, it outputs the cleaned-up **tree.html** structure for the directory.

This program can be useful for quickly visualizing the structure of a directory and its subdirectories, and can be especially helpful when dealing with large and complex directory trees.