;; -*- flycheck-disabled-checkers: (emacs-lisp-checkdoc) -*-

;; A quick elisp script to install lsp mode for testing `lsp-blueprint' with
;; `lsp-mode'. This'll install LSP Mode from MELPA Stable.
(require 'package)
(setq package-user-dir (concat (temporary-file-directory) "emacs-blp-test"))
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)
(custom-set-variables '(native-comp-async-report-warnings-errors nil))
  (package-install 'lsp-mode)
(add-hook 'kill-emacs-hook (lambda ()
                             (shell-command (concat "rm -rf " (shell-quote-argument package-user-dir)))))
