# bsd

Reference for configuring a BSD workstation 😈

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

## Quick GUI Setup
#### Xfce
`$ su`\
`$ pkg install xorg`\
`$ echo "exec /usr/local/bin/startxfce4 --with-ck-launch" > /usr/home/username/.xinitrc`
```
# /etc/rc.conf
dbus_enable="YES"
hald_enable="YES"
```
`$ startx`

This proivdes general instruction on three popular desktop environments, Gnome,
KDE and Xfce\
[Desktop Environments](https://www.freebsd.org/doc/handbook/x11-wm.html)

## Getting Software

#### pkg

Install pre-compiled binaries

`$ pkg update` - Update list of packages

`$ pkg install <package>`

#### ports

`$ portsnap fetch extract` - Collects an updated ports tree

`$ cd /usr/ports/<category>/<portname> && make install` - compile a port

`$ make config-recursive` - Select config options before building

`$ make install` - builds port

## Configuration Checks & Commands

#### Checks

`$ locale` - prints language and encoding configurations

`$ cat /dev/sndstat` - List sound devices installed. [man sound](https://www.freebsd.org/cgi/man.cgi?sound)

`$ echo "test" > /dev/dsp` - will produce sound if drivers are working

### Commands

`$ pw usermod <username> -G wheel` - add user to wheel group required for invoking
things like `su`

`$ pw groupshow wheel` - list users in group (wheel) [man
pw](https://www.freebsd.org/cgi/man.cgi?pw(8))

`$ service pf start` - starts up firewall, configured in `/etc/pf.conf`

`$ pfctl -f /etc/pf.conf` - after making rule changes in `/etc/pf.conf`, `pftcl` reloads and runs the new configuration and aborts if your ruleset contains an error

### mouse
Using `moused` [man moused](https://www.freebsd.org/cgi/man.cgi?moused) \
These work well for trackpads

```
# /etc/rc.conf
moused_enable="YES"
moused_flags="F 200 -A 1.0,2.0 -a 0.7 -r high"
```

### Sound

`/etc/sysctl.conf` - Kernel state defaults [man sysctl.conf](https://www.freebsd.org/cgi/man.cgi?sysctl.conf(5))

[man pcm](https://www.freebsd.org/cgi/man.cgi?query=pcm&sektion=4&manpath=freebsd-release-ports)

* `$ cat /dev/sndstat` to review available sound devices. Note which `pcm` you'd like to use and note it's module number, ex. `pcm0`.

* in `/etc/sysctl.conf` set `hw.snd.default_unit` variable and assign it
the value of `pcm`, ex. `hw.snd.default_unit=0` 

* Enabling the `hw.snd.default_auto` boolean will automatically assign newly
attached devices to `hw.snd.default_unit`, ex. `hw.snd.default_auto=0`

## Notes

These conf files are geared towards settings up FreeBSD with a desktop
environment.
