;;; lsp-blueprint.el --- `lsp-mode' support for `blueprint-mode' -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2022 Alexander Bisono
;;
;; Author: Alexander Bisono <sbisonol@gmail.com>
;; Maintainer: Alexander Bisono <sbisonol@gmail.com>
;; Created: August 02, 2022
;; Modified: August 02, 2022
;; Version: 0.1.0
;; Keywords: abbrev bib c calendar comm convenience data docs emulations extensions faces files frames games hardware help hypermedia i18n internal languages lisp local maint mail matching mouse multimedia news outlines processes terminals tex tools unix vc wp
;; Homepage: https://github.com/drbluefall/lsp-blueprint
;; Package-Requires: ((emacs "24.3") (lsp-mode "8.0.0"))
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;;
;;  This file provides `lsp-mode' integration for `blueprint-mode'.
;;
;;; Code:

(require 'blueprint-mode)
(require 'lsp)

(add-to-list 'lsp-language-id-configuration '(blueprint-mode . "blueprint-compiler"))

(defgroup lsp-blueprint nil
  "LSP Mode support for GTK+ Blueprint Compiler files."
  :group 'lsp-mode
  :link '(url-link "https://gitlab.gnome.org/jwestman/blueprint-compiler"))

(defcustom lsp-blueprint-compiler-executable "blueprint-compiler"
  "Path to the compiler."
  :group 'lsp-blueprint
  :risky t
  :type 'file)

(defcustom lsp-blueprint-compiler-logpath nil
  "Optional path to a logfile."
  :group 'lsp-blueprint
  :safe t
  :type 'file)

(defun lsp-blueprint--server-cmd ()
  "Generate the command to invoke the server."
  (let ((cmd nil))
    (push (file-truename lsp-blueprint-compiler-executable) cmd)
    (push "lsp" cmd)
    (when lsp-blueprint-compiler-logpath
      (push "--logfile" cmd)
      (push lsp-blueprint-compiler-logpath cmd))
    (nreverse cmd)))

(lsp-register-client
 (make-lsp-client :new-connection (lsp-stdio-connection #'lsp-blueprint--server-cmd)
                  :activation-fn (lsp-activate-on "blueprint-compiler")
                  :server-id 'blueprint-compiler))

(add-hook 'blueprint-mode-hook #'lsp)

(provide 'lsp-blueprint)
;;; lsp-blueprint.el ends here
