# `blueprint-mode.el`

A GNU Emacs major mode for GTK+
[Blueprint](https://gitlab.gnome.org/jwestman/blueprint-compiler) files.

**NOTE**: This major mode is *very* incomplete. It doesn't even have syntax
highlighting yet. If you're any better at Emacs and can understand the black
magic that is `font-lock-mode`, please file a pull request.

# Usage

With `straight.el`

``` emacs-lisp
(straight-use-package
    '(blueprint-mode :type git
                     :host github
                     :repo "DrBluefall/blueprint-mode"))
```

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

