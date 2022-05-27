;;; blueprint-mode.el --- Major Mode for Blueprint Language files -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2022 Alexander Bisono
;;
;; This program is free software: you can redistribute it and/or modify it under
;; the terms of the GNU General Public License as published by the Free Software
;; Foundation, either version 3 of the License, or (at your option) any later
;; version.
;;
;; This program is distributed in the hope that it will be useful, but WITHOUT ANY
;; WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
;; PARTICULAR PURPOSE. See the GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License along with
;; this program. If not, see <https://www.gnu.org/licenses/>.
;;
;;
;; Author: Alexander Bisono <sbisonol@gmail.com>
;; Maintainer: Alexander Bisono <sbisonol@gmail.com>
;; Created: May 24, 2022
;; Modified: May 24, 2022
;; Version: 0.0.1
;; Homepage: https://github.com/drbluefall/blueprint-mode
;; Package-Requires: ((emacs "24.3") (lsp-mode "8.0.0"))
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;;
;; This file provides support and LSP integration for `.blp' files, used with the Blueprint Compiler.
;;
;;; Code:

(require 'lsp)

(defvar blueprint--font-lock-defaults nil)

;;;###autoload
(define-derived-mode blueprint-mode prog-mode "Blueprint"
  "Major mode for Blueprint Compiler files."
  (setq font-lock-defaults '(blueprint--font-lock-defaults)))

;;;###autoload
(add-to-list 'auto-mode-alist '("\\.blp\\'" . blueprint-mode))

(add-to-list 'lsp-language-id-configuration '(blueprint-mode . "blueprint-compiler"))

(lsp-register-client
 (make-lsp-client :new-connection (lsp-stdio-connection '("blueprint-compiler" "lsp"))
                  :activation-fn (lsp-activate-on "blueprint-compiler")
                  :server-id 'blueprint-compiler))

(provide 'blueprint-mode)
;;; blueprint-mode.el ends here
