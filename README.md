# 猫(Neko)

A Mac OS X port of the [Neko program](http://en.wikipedia.org/wiki/Neko_%28computer_program%29) written in Objective-C. You can run Oneko
on Mac OS X but the cat doesn't appear in front of Mac OS applications, so I
ported it to Cocoa. My version does not change the mouse cursor or support
different themes. This is based off the public domain Oneko code.

This program does not show up in the dock. To close it, you either need to open
the terminal and type `killall Neko` or open the Activity Monitor and quit
Neko.

## Building

Requires macOS 11 or later and the Xcode command line tools
(`xcode-select --install`).

    make            # build and sign build/Neko.app
    make run        # build and launch it
    make install    # build, copy to ~/Applications and (re)launch
    make clean

`make` signs with the maintainer's Developer ID. Without that key, use an
ad-hoc signature instead:

    make IDENTITY=-
