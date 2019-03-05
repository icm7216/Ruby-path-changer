# Ruby-path-changer

This script rewrites the Windows path of multiple versions of Ruby. It works at the Windows command prompt.

# Usage

change to version xx.
```
> rp xx
```

If you want to change to ruby2.5
```
> rp 25
```

Display available list.
```
> rp list
```

Example of my `rp list` display.
```
> rp list
Available Ruby version:

Name: Ruby version
233 : ruby 2.3.3p222 (2016-11-21 revision 56859) [i386-mingw32]
24 : ruby 2.4.5p335 (2018-10-18 revision 65137) [x64-mingw32]
25 : ruby 2.5.3p105 (2018-10-18 revision 65156) [x64-mingw32]
26 : ruby 2.6.1p33 (2019-01-30 revision 66950) [x64-mingw32]
```

# Setting

Required setting before your use
*   Please edit the target Ruby PATH in `rbp.bat`, before starting.  You need to write all Ruby versions you want to switch. 
*   The Ruby path of the Windows environment variable should be set to the default Ruby path only.

There is no function to register installed Ruby automatically.



##  Setting items of `rb.bat` file 

The required fields in the `rb.bat` file are shown below. Please edit the following 1, 2 and 3 items.

### [1] default Ruby PATH
```
set DEFDIR=C:\Ruby25-x64\bin
```

### [2] Write a list of the paths you want to switch

*   The first letter is always "R".
*   The next number means the argument to be used when switching.
*   Write the path to the right of "=".
```
set R24=C:\Ruby24-x64\bin
set R25=C:\Ruby25-x64\bin
set R26=C:\Ruby26-x64\bin
```
### [3] Write the number of the version to switch
```
set R_LIST=24 25 26
```



# License

MIT
