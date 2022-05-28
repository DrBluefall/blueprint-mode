# `blueprint-mode.el`

A GNU Emacs major mode for GTK+
[Blueprint](https://gitlab.gnome.org/jwestman/blueprint-compiler) files.

**NOTE**: This major mode is *very* incomplete. The syntax highlighting is far
from done, and there are things that I want this mode to do that it has yet to
(like formatting). I'm also *not that good at elisp*, so I welcome all the
assistance I can get. - Dr. Bluefall

# Usage

With `straight.el`:

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

