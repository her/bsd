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

## Build Settings

Certain third-party software options must be set at compile time. These should be installed and configured before building your GUI. 

* [**QGtkStyle**](https://en.wikipedia.org/wiki/QGtkStyle) - Open source project to create a GTK+ layer for Qt-based applications running on GTK2-based desktops.

* **[CUPS](https://www.freebsd.org/doc/en/articles/cups/)** - Standard printing engine on Unlix-like systems. Support for it in QT can be enabled with the `CUPS` QT4 option.

* [**The Network Audio System (NAS)**](http://www.radscan.com/nas.html) - The Network Audio System is a network transparent, client/server audio transport system. It can be described as the audio equivalent of an X server.


`echo "QT4_OPTIONS=    CUPS QGTKSTYLE NAS" >> /etc/make.conf`

If you change `QT4_OPTIONS` after Qt is installed you need to rebuild `devel/qt4-corelib` and `x11-toolkits/qt4-gui`

## Getting Software

`# pkg update` - fetches updated index from every `PACKAGESITE` 

`# portsnap fetch extract` - retrieves a new full ports tree

**Ports** - build ports with `# cd /usr/ports/<category>/<portname> && make install`

`# make config-recursive` - presents all port configuration options before
building, run until no more options display

`# make install` - builds port

**pkg** - install ports with `# pkg install <portname>`

## Configuration Checks & Commands

### Checks

`# locale` - prints language and encoding configurations for admin review

`# cat /dev/sndstat` - prints the status of the sound card and which driver was selected for the sound card after loading the `snd_driver_load="YES"` metadriver in `/boot/loader.conf`

`# cat filename > /dev/dsp` - produce noise and test sound card by sending data
to `/dev/dsp`, where `filename` can be any file type.

### Commands

`wheel` - allows user to invoke `su` and become root. enable with `pw usermod
<username> -G wheel`

`operator` - required for device permissions. enable with `pw usermod
<username> -G operator`

`# service pf start` - starts up firewall, configured in `/etc/pf.conf`

`# pfctl -f /etc/pf.conf` - after making rule changes in `/etc/pf.conf`, `pftcl` reloads and runs the new configuration and aborts if your ruleset contains an error

## Sound

**Your sound card needs configured. `/etc/sysctl.conf` contains a section
commented as "Sound" with examples for the instructions below**

* Configure sound by first running `# cat /dev/sndstat` to review available sound
devices. Note which `pcm` you'd like to use and note it's module number, ex. `pcm0`.

* Next add the `hw.snd.default_unit` variable in `/etc/sysctl.conf` and assign it
the value of `pcm`, ex. `hw.snd.default_unit=0` 

* Enabling the `hw.snd.default_auto` boolean will automatically assign newly
attached devices to `hw.snd.default_unit`, ex. `hw.snd.default_auto=0`

## Optional Add-Ons

**sudo** - `security/sudo` without this port(or pkg) no users can run `sudo`.
after install login as root to configure `sudoers` file located at 
`/usr/local/etc/sudoers`, run `# visudo` and add `%wheel ALL=(ALL) ALL` to
allow members of group wheel to execute sudo. also add `<username> ALL=(ALL)
ALL` to allow specified user to run sudo. save and close the file.

**git** - `devel/git` 

**zsh** - `shells/zsh` with [auto-suggestions](https://github.com/zsh-users/zsh-autosuggestions) and [syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md) creates a POSIX compliable fish-like experience that intergrates nicely with FreeBSD. `.zshrc` is included in this repository.

**tmux** - `sysutils/tmux`

**vim** - `editors/vim`

## Notes

These conf files are geared towards settings up FreeBSD with a desktop
environment.

## Thanks

[The FreeBSD Project](https://www.freebsd.org) for their amazing work and software.

[FreeBSD IRC Channels](https://wiki.freebsd.org/IrcChannels) for being such a nurturing and knowledgeable community.

[Allison Nicole Reid :octocat:](https://github.com/okeeblow/) for her awesome blog [cooltrainer](cooltrainer.org) detailing BSD configurations. 

[Marshall Kirk McKusick](https://www.mckusick.com/beastie/mainpage/copyright.html) for his many contributions to FreeBSD, including Beastie! 
