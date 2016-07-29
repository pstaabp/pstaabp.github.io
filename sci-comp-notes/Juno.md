## Getting Atom

Download, install and open [Atom](https://atom.io). If you have it already, make sure it's up to date (version 1.7+).

In Atom, go to Settings (<kbd>Ctrl ,</kbd>, or <kbd>Cmd ,</kbd> on OS X) and go to the "Install" panel.

Type `uber-juno` into the search box and hit enter. Click the install button on the package of the same name.

Atom will then set up Juno for you, installing the required Atom and Julia packages. Once the setup is done you're good to go!

This doesn't always work smoothly.  Read the errors if there are any.  Typically, if you go to a terminal window, and type `Pkg.update()` or `Pkg.build()`, this will fix the errors.

## Notes (taken from the [Juno lab site](https://github.com/JunoLab/uber-juno/blob/master/setup.md))

If you have any issues with this setup, please do report it here or at [Juno Discuss](http://discuss.junolab.org). We'll do our best to help you get going.

The development version of Julia (v0.5) isn't officially supported via these instructions. If you know what you're doing you can get it working by following [these instructions](https://github.com/JunoLab/atom-julia-client/tree/master/docs).

[Let us know](http://discuss.junolab.org) if you have any other issues or questions.
