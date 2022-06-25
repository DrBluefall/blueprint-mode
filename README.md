# `blueprint-mode.el`

A GNU Emacs major mode for GTK+
[Blueprint](https://gitlab.gnome.org/jwestman/blueprint-compiler) files.

**NOTE**: This major mode is in its early stages. The syntax highlighting is
done (albeit rudimentary in this author's opinion), and there are probably many
things that this mode could be extended to do. I'm also *not that good at
elisp*, so I welcome all the assistance I can get. - Dr. Bluefall

# Usage

With `straight.el`:

``` emacs-lisp
(straight-use-package
    '(blueprint-mode :type git
                     :host github
                     :repo "DrBluefall/blueprint-mode"))
```

# Contributing

If you want to work on `blueprint-mode`, I advise that you clone 2 additional
repositories:

- [`blueprint-compiler`](https://gitlab.gnome.org/jwestman/blueprint-compiler)
- and [`blueprint-regression-tests`](https://gitlab.gnome.org/jwestman/blueprint-regression-tests)

The latter has blueprint files from projects in the wild, which could prove
useful for testing any features you intend to implement in `blueprint-mode`.

# LICENSE

Copyright (C) 2022 Alexander Bisono.

This program is free software: you can redistribute it and/or modify it under
the terms of the GNU General Public License as published by the Free Software
Foundation, either version 3 of the License, or (at your option) any later
version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with
this program. If not, see <https://www.gnu.org/licenses/>.

