# bsd

**Bootstrap a FreeBSD Workstation**:smiling_imp:

Sensible configuration defaults for rapidly deploying a fresh BSD workstation. 
````
                                ,        ,         
                               /(        )`        
                               \ \___   / |        
                               /- _  `-/  '        
                              (/\/ \ \   /\        
                              / /   | `    \       
                              O O   ) /    |       
                              `-^--'`<     '       
                             (_.)  _  )   /        
                              `.___/`    /         
                                `-----' /          
                   <----.     __ / __   \          
                   <----|====O)))==) \) /====      
                   <----'    `--' `.__,' \         
                                |        |         
                                 \       /       /\
                            ______( (_  / \______/ 
                          ,'  ,-----'   |          
                          `--{__________)  
````
## Usage

After installing FreeBSD, clone the repository and place files in their relative
directories. Each file details:

* it's relative path, i.e. where the file belongs
* it's purpose and use
* any additionally required or recommended instructions

## Configuration Checks

`$ locale` - prints language and encoding configurations for admin review

## Build Settings

Certain third-party software options must be set at compile time. These should be installed and configured before building your GUI. 

* [**QGtkStyle**](https://en.wikipedia.org/wiki/QGtkStyle) - Open source project to create a GTK+ layer for Qt-based applications running on GTK2-based desktops.

* **CUPS** - Standard printing engine on Unlix-like systems. Support for it in QT can be enabled with the `CUPS` QT4 option.

* [**The Network Audio System (NAS)**](http://www.radscan.com/nas.html) - The Network Audio System is a network transparent, client/server audio transport system. It can be described as the audio equivalent of an X server.


`echo "QT4_OPTIONS=    CUPS QGTKSTYLE NAS" >> /etc/make.conf`

If you change `QT4_OPTIONS` after Qt is installed you need to rebuild `devel/qt4-corelib` and `x11-toolkits/qt4-gui`


## Notes

These conf files are geared towards settings up FreeBSD with a desktop
environment.

## Thanks

[The FreeBSD Project](https://www.freebsd.org) for their amazing work and software.

[FreeBSD IRC Channels](https://wiki.freebsd.org/IrcChannels) for being such a nurturing and knowledgeable community.

[Allison Nicole Reid :octocat:](https://github.com/okeeblow/) for her awesome blog [cooltrainer](cooltrainer.org) detailing BSD configurations. 
