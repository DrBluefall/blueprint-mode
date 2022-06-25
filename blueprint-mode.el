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
;; Modified: June 25, 2022
;; Version: 0.1.2
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


(defvar blueprint-mode-syntax-table nil)
(setq blueprint-mode-syntax-table
      (let ((st (make-syntax-table prog-mode-syntax-table)))

        ;; Support C-style comments.
        (modify-syntax-entry ?/  ". 124b" st)
        (modify-syntax-entry ?*  ". 23"   st)
        (modify-syntax-entry ?\n "> b"    st)
        (modify-syntax-entry ?\^m "> b"   st)

        ;; Treat underscores and dashes as part of symbols.
        (modify-syntax-entry ?- "_" st)
        (modify-syntax-entry ?- "_" st)

        st))

(defvar blueprint--font-lock-defaults nil)
(setq blueprint--font-lock-defaults
  (let* (
         ;; Define basic keywords
         (bp-keywords '("accessibility" "attributes" "bind"
                        "item" "layout" "menu" "section"
                        "submenu" "swapped" "using" "template"))

         (bp-constants '("start" "end" "false" "no" "yes" "true" "horizontal" "vertical"))

         ;; turn those into regexes
         (bp-keywords-regex (regexp-opt bp-keywords 'symbols))
         (bp-constants-regex (regexp-opt bp-constants 'symbols))
         ;; Define some custom ones
         (bp-starting-dot "^\\.")
         (bp-signal-arrow "=>")
         (bp-signal-function-regex "\\([[:alnum:]:_-]+\\)()")
         (bp-signal-name-regex "\\([[:alpha:]_-]+\\(::[[:alpha:]_-]+\\)?\\)[[:space:]]+=>")
         (bp-property-regex "[A-Za-z_-]+:\\|styles")
         (bp-property-regex-alt "\\[[=A-Za-z_-]+\\]")
         (bp-namespace-regex "\\(\\w+\\)\\.")
         (bp-class-regex "[[:upper:]]\\w+"))
    `((,bp-keywords-regex . font-lock-keyword-face)
      (,bp-signal-function-regex . '(1 font-lock-function-name-face))
      (,bp-signal-name-regex . '(1 font-lock-variable-name-face))
      (,bp-property-regex . font-lock-variable-name-face)
      (,bp-property-regex-alt . font-lock-variable-name-face)
      (,bp-starting-dot . font-lock-keyword-face)
      (,bp-signal-arrow . font-lock-keyword-face)
      (,bp-constants-regex . font-lock-constant-face)
      (,bp-class-regex . font-lock-type-face)
      (,bp-namespace-regex . '(1 font-lock-type-face)))))

;;;###autoload
(define-derived-mode blueprint-mode prog-mode "Blueprint"
  "Major mode for Blueprint Compiler files."
  (setq-local font-lock-defaults '(blueprint--font-lock-defaults))
  (set-syntax-table blueprint-mode-syntax-table))

;;;###autoload
(add-to-list 'auto-mode-alist '("\\.blp\\'" . blueprint-mode))

(add-to-list 'lsp-language-id-configuration '(blueprint-mode . "blueprint-compiler"))

(lsp-register-client
 (make-lsp-client :new-connection (lsp-stdio-connection '("blueprint-compiler" "lsp"))
                  :activation-fn (lsp-activate-on "blueprint-compiler")
                  :server-id 'blueprint-compiler))

(provide 'blueprint-mode)
;;; blueprint-mode.el ends here
