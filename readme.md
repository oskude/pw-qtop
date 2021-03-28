# pw-qtop

tried [pipewire](https://gitlab.freedesktop.org/pipewire/pipewire) for the first time, and wow, [almost](https://wiki.archlinux.org/index.php/PipeWire#JACK_clients) with no configuration "everything" (mostly) just works!

then found `pw-top` and `pw-dump` and i just could not resist to play with the data in [qml](https://qmlbook.org):

```
 ./pw-qtop
```

and play with them clients:

![screencap](wincap.gif?raw=true)

> note: i most likely abandon this thing after push ;P so please feel free to steal anything\*  
> well, theres not much to steal, i just "connetget the dots" `¯\_(ツ)_/¯`

## requirements

- _pipewire running_
- qt6-declarative
- pyside6

> note: should also work with qt5 if you change to pyside2 in [pw-qtop](./pw-qtop), and add import version numbers in [main.qml](./main.qml).

> tip: https://aur.archlinux.org/packages/pipewire-common-git/

## todo

- the parents...
- what actually are all the values in `pw-top`?
- get current latency for `node.driver`?
- get current `channelVolumes` for jack clients? (at least pd has none)
- get actual audio "loudness?" value? (you know, those moving bars in pavucontrol)
- set values? (volume)
- any "vanilla" pipewire clients yet?

<br>
<hr>

\*All files in this repo - _where i have the say about_ - shall be in Public Domain.
