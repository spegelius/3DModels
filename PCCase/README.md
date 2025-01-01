
# 3D printed PC case, customizable

This is a mostly 3D printed PC case, modeled in OpenSCAD. The frame is built using [Dollo3D](https://reprap.org/wiki/Dollo) 'extention' pieces which allows for quite easy size customization. Current parts from my Dollo3D fork: https://github.com/spegelius/Dollo.

![](doc/case1.png)
![](doc/case2.png)

The project is quite big one so it takes time and material to build. Currently made for ATX and EE-ATX form factor (and one custom Raspberry Pi NAS/Chia mining case which is a separate project using this as base).

## Dimensions
Dimensions and orientation is shown in following picture. Parts specific for certain case size use WxDxH-notation and when certain dimension doesn't matter (for example motherboard back plate doesn't care about depth), the dimension is omitted (WxH motherboard back plate example).
![](doc/dimensions.png)

## Sizes
Note that the 30x30mm Dollo3D frame pieces makes the  case bit bigger than regular case would be.

Currently following sizes are implemented:
- 230x430x480: ATX case, probably the smallest possible ATX case to build.
- 230x500x520: ATX case, has extra room for watercooling radiator (360).
- 240x540x525: EE-ATX case for SuperMicro server motherboard. Not sure if the EE-ATX spec is a standard...
- 240x540x550: EE-ATX case for SuperMicro server motherboard. Not sure if the EE-ATX spec is a standard...

Other sizes:
- 315x520x520: WIP ATX case, intended to house 2x360 radiators. No ETA if this will become reality ever...
- 218x400x400: special case made for Raspberry Pi NAS/Chia mining. Full Implemented in spearate project.

### Size customization
To create a case with size not listed above, the easiest way is to contact me. However, creating the size specific parts is quite straightforward, but does require some OpenSCAD experience.

I recommend copying one of the case_WxDxH.scad files and modifying the dimensions there to see how it works out.
Use following files to check and generate needed files:
- cover.scad
- motherboard.scad
- fans.scad
- hdd.scad
- motherboard.scad
- psu.scad



