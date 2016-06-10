# bsd

:smiling_imp: Bootstrap FreeBSD

These are some rudimentary conf files providing a baseline for rapidly
deploying a fresh BSD workstation. After install clone repo and place
files in their relative directories.

## Configuration Checks

`$ locale` - prints language and encoding configurations for admin review

## Build Settings

[QGtkStyle](https://en.wikipedia.org/wiki/QGtkStyle) - Open source project to create a GTK+ layer for Qt-based applications running on GTK2-based desktops.

If you change `QT4_OPTIONS` after Qt is installed you need to rebuild `devel/qt4-corelib` and `x11-toolkits/qt4-gui`

**CUPS** - Standard printing engine on Unlix-like systems. Support for it in QT can be enabled with the `CUPS` QT4 option.

`echo "QT4_OPTIONS=    CUPS QGTKSTYLE NAS" >> /etc/make.conf`

[The Network Audio System (NAS)](http://www.radscan.com/nas.html)

## Notes

These conf files are geared towards settings up FreeBSD with a desktop
environment.

## Thanks

[The FreeBSD Project](https://www.freebsd.org) for their amazing work and software.

[FreeBSD IRC Channels](https://wiki.freebsd.org/IrcChannels) for being such a nurturing and knowledgeable community.

[Allison Nicole Reid](https://cooltrainer.org/a-freebsd-desktop-howto/) [:octocat:](https://github.com/okeeblow/) for her awesome blog [cooltrainer](cooltrainer.org) which helped me configure my BSD station. 
