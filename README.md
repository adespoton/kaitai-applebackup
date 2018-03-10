# kaitai-applebackup
Kaitai Struct representation of the Apple Backup file format
based on https://www.downtowndougbrown.com/2013/06/legacy-apple-backup-file-format-on-floppy-disks/

The easiest way to use these files is to download the Data files and the ksy file, navigate to https://ide.kaitai.io/ and drag the files onto the interface.  The ksy file will be loaded for live editing on the left, and the data file to parse will be loaded on the right.  You can double click the files at any time from the navigation panel on the lower left.

The struct file can be converted by the main Kaitai Struct compiler found at http://kaitai.io/#download to create parsing libraries for many common programming languages.  These can be used to write code in your favorite language to browse and/or extract the entire archive or specific files.


I've also included an ab2mb.txt file that has some pseudocode outlining what would be needed to write a converter, and some pre-compiled source for languages that kaitai-struct exports to, for people to easily include in their own projects.

Enjoy!
