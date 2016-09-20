The Fast Iterative Digital Volume Correlation Algorithm (FIDVC) is the next generation DVC algorithm providing significantly improved signal-to-noise, and large (finite) deformation (incl. large rotations and image stretches) capture capability at low computational cost (please see [Bar-Kochba, Toyjanova et al., Exp. Mechanics, 2014](http://link.springer.com/article/10.1007/s11340-014-9874-2?sa_campaign=email/event/articleAuthor/onlineFirst) for more details).

### Important pages
* [Download latest version v1.2.3!](https://github.com/FranckLab/FIDVC/releases)
* [Example data](https://drive.google.com/folderview?id=0ByhZqlrbo5srSmU2ZW1TOXpfVkE&usp=sharing)
* [FAQ](https://github.com/FranckLab/FIDVC#faq)
* [Questions/Issues](https://github.com/FranckLab/FIDVC/issues)
* [Bug Fixes/history](https://github.com/FranckLab/FIDVC/wiki/Bug-Fixes!)
* [Franck Lab](http://franck.engin.brown.edu)
 
## This Fork:
* Adds a rather simplistic paralization for MATLAB, with "parfor" for some of the longer-running for loops
* This gives a speedup factor of about 1.8 for 24 processors on a relatively complex image, but slightly less than 1 on the example data. YMMV
* Adds data output for [ParaView](http://www.paraview.org/) via the [vtkwrite](https://www.mathworks.com/matlabcentral/fileexchange/47814-vtkwrite---exports-various-2d-3d-data-to-paraview-in-vtk-file-format) function from the Mathworks File Exchange with paraviewOutput.m
* Rename folder to remove spaces
* Warning: this has not be tested extensively or for many cases (no testing other than for the example data and my own work has been conducted).

## See the original project for more
[FranckLab/FIDVC](https://github.com/FranckLab/FIDVC)
