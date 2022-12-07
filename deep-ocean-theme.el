;;; deep-ocean-theme.el --- Material Deep Ocean theme
;; Copyright (C) 2022 Arijit Dey
;; Version: 0.1.0

;; Author: Arijit Dey <arijit79@protonmail.com>
;; Keywords: faces

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.;

;;; Commentary:
;; This is the Emacs port of the deep ocean theme from Visual Studio Code and Neovim.
;; Check out there official pages here
;;
;; https://marketplace.visualstudio.com/items?itemName=itsdevdom.theme-deep-ocean
;; https://github.com/marko-cerovac/material.nvim#-features

;;; Code:

(deftheme deep-ocean "Deep ocean - Emacs port of the Material Deep Ocean theme from Visual Studio Code and Newvim.")

(eval-and-compile
  (defvar deep-ocean-colors-alist

    '(
      ;; Standard colors
      ("deep-ocean.colors.white"                       . "#EEFFFF")
      ("deep-ocean.colors.gray"                        . "#717CB4")
      ("deep-ocean.colors.black"                       . "#000000")
      ("deep-ocean.colors.red"                         . "#F07170")
      ("deep-ocean.colors.green"                       . "#C3E88D")
      ("deep-ocean.colors.yellow"                      . "#FFCB6B")
      ("deep-ocean.colors.blue"                        . "#82AAFF")
      ("deep-ocean.colors.paleblue"                    . "#B0C9FF")
      ("deep-ocean.colors.cyan"                        . "#89DDFF")
      ("deep-ocean.colors.purple"                      . "#C792EA")
      ("deep-ocean.colors.orange"                      . "#F78C6C")
      ("deep-ocean.colors.darkred"                     . "#DC6068")
      ("deep-ocean.colors.darkgreen"                   . "#ABCF76")
      ("deep-ocean.colors.darkyellow"                  . "#E6B455")
      ("deep-ocean.colors.darkblue"                    . "#6E98EB")
      ("deep-ocean.colors.darkcyan"                    . "#71C6E7")
      ("deep-ocean.colors.darkpurple"                  . "#B480D6")
      ("deep-ocean.colors.darkorange"                  . "#E2795B")
      ("deep-ocean.colors.accent"                      . "#84FFFF")

      ;; Editor colors
      ("deep-ocean.editor.bg"                          . "#0F111A")
      ("deep-ocean.editor.alt-bg"                      . "#FFFFFF")
      ("deep-ocean.editor.fg"                          . "#A6ACCD")
      ("deep-ocean.editor.fg-dark"                     . "#717CB4")
      ("deep-ocean.editor.selection"                   . "#1F2233")
      ("deep-ocean.editor.active-line-number"          . "#84FFFF")
      ("deep-ocean.editor.inactive-line-number"        . "#3B3F51")
      ("deep-ocean.editor.active"                      . "#090B10")
      ("deep-ocean.editor.cursor"                      . "#FFCC00")
      ("deep-ocean.editor.highlight"                   . "#1F2233")
      ("deep-ocean.editor.border"                      . "#232637")

      ;; Syntax
      ("deep-ocean.syntax.disabled"                    . "#464B5D")
      ("deep-ocean.syntax.comments"                    . "#464B5D"))
    "Color pallate for Deep Ocean theme"))

(defmacro deep-ocean-theme-with-color-variables (&rest body)
  "Binds all color defined in `deep-ocean-colors-alist` around BODY."
  (declare (indent 0))
  `(let ((class '((class color) (min-color UxFFFFFF)))
         ,@(mapcar (lambda (cons)
                     (list (intern (car cons)) (cdr cons)))
                   deep-ocean-colors-alist))
     ,@body))

(deep-ocean-theme-with-color-variables
 (custom-theme-set-faces
  'deep-ocean

  ;; Ediitor
  `(default                             ((t (:foreground ,deep-ocean.editor.fg :background ,deep-ocean.editor.bg))))
  `(region                              ((t (:background ,deep-ocean.editor.selection))))
  `(line-number-current-line            ((t (:foreground ,deep-ocean.editor.active-line-number))))
  `(line-number                         ((t (:foreground ,deep-ocean.editor.inactive-line-number))))
  `(cursor                              ((t (:background ,deep-ocean.editor.alt-bg))))
  `(hl-line                             ((t (:background ,deep-ocean.editor.active))))
  `(highlight                           ((t (:background ,deep-ocean.editor.highlight))))

  ;; UI elements
  `(custom-button                       ((t (:foreground ,deep-ocean.colors.purple :background ,deep-ocean.editor.border))))
  `(custom-link                         ((t (:foreground ,deep-ocean.colors.blue :underline t))))
  `(custom-state                        ((t (:foreground ,deep-ocean.colors.green))))
  `(widget-field                        ((t (:background ,deep-ocean.editor.border))))
  `(widget-inactive                     ((t (:foreground ,deep-ocean.colors.darkred :background ,deep-ocean.syntax.disabled))))
  `(custom-group-tag                    ((t (:foreground ,deep-ocean.colors.accent :weight bold :height 150))))
  `(mode-line                           ((t (:background ,deep-ocean.editor.active))))
  `(mode-line-inactive                  ((t (:background ,deep-ocean.editor.bg))))
  `(fringe                              ((t (:background ,deep-ocean.editor.border))))

  ;; Minibuffer and completion
  `(minibuffer-prompt                   ((t (:foreground ,deep-ocean.colors.accent :weight bold))))
  `(marginalia-date                     ((t (:foreground ,deep-ocean.colors.green))))
  `(marginalia-file-priv-dir            ((t (:foreground ,deep-ocean.colors.accent))))
  `(marginalia-file-priv-read           ((t (:foreground ,deep-ocean.colors.darkblue))))
  `(marginalia-file-priv-exec           ((t (:foreground ,deep-ocean.colors.darkgreen))))
  `(marginalia-file-priv-write          ((t (:foreground ,deep-ocean.colors.darkpurple))))
  `(marginalia-size                     ((t (:foreground ,deep-ocean.colors.paleblue))))
  `(marginalia-file-owner               ((t (:foreground ,deep-ocean.colors.blue))))
  `(marginalia-file-priv-no             ((t (:foreground ,deep-ocean.colors.red))))

  ;; Dired
  `(diredfl-dir-name                    ((t (:foreground ,deep-ocean.colors.accent))))
  `(diredfl-file-name                   ((t (:foreground ,deep-ocean.colors.blue))))
  `(diredfl-number                      ((t (:foreground ,deep-ocean.colors.green))))
  `(diredfl-no-priv                     ((t (:foreground ,deep-ocean.colors.red))))
  `(diredfl-exec-priv                   ((t (:foreground ,deep-ocean.colors.darkgreen))))
  `(diredfl-read-priv                   ((t (:foreground ,deep-ocean.colors.darkblue))))
  `(diredfl-write-priv                  ((t (:foreground ,deep-ocean.colors.darkpurple))))
  `(diredfl-dir-priv                    ((t (:foreground ,deep-ocean.colors.accent))))
  `(diredfl-rare-priv                   ((t (:foreground ,deep-ocean.colors.darkorange))))
  `(diredfl-date-time                   ((t (:foreground ,deep-ocean.colors.paleblue))))
  `(diredfl-deletion                    ((t (:foreground ,deep-ocean.colors.white :background ,deep-ocean.colors.red))))
  `(diredfl-dir-heading                 ((t (:foreground ,deep-ocean.colors.cyan :weight bold))))

  ;; Doom emacs
  `(doom-dashboard-menu-title           ((t (:foreground ,deep-ocean.colors.darkpurple))))
  `(doom-dashboard-menu-desc            ((t (:foreground ,deep-ocean.colors.darkorange))))
  `(doom-dashboard-banner               ((t (:foreground ,deep-ocean.colors.darkblue))))
  `(doom-dashboard-footer-icon          ((t (:foreground ,deep-ocean.colors.darkpurple))))
  `(doom-dashboard-footer               ((t (:foreground ,deep-ocean.colors.darkblue))))
  `(doom-dashboard-loaded               ((t (:foreground ,deep-ocean.colors.darkblue))))
  `(doom-modeline-buffer-modified       ((t (:foreground ,deep-ocean.colors.red :weight bold))))
  `(doom-modeline-evil-normal-state     ((t (:foreground ,deep-ocean.colors.green))))
  `(doom-modeline-evil-visual-state     ((t (:foreground ,deep-ocean.colors.orange))))
  `(doom-modeline-evil-operator-state   ((t (:foreground ,deep-ocean.colors.paleblue))))


  ;; Company mode
  `(company-tooltip                     ((t (:foreground ,deep-ocean.editor.fg :background ,deep-ocean.editor.border))))
  `(company-tooltip-selection           ((t (:foreground ,deep-ocean.editor.active :background ,deep-ocean.colors.accent))))
  `(company-tooltip-common-selection    ((t (:foreground ,deep-ocean.editor.fg-dark :weight bold))))
  `(company-tooltip-mouse               ((t (:foreground ,deep-ocean.editor.active :background ,deep-ocean.colors.darkcyan))))
  `(company-tooltip-scrollbar-track     ((t (:background ,deep-ocean.editor.selection))))
  `(company-tooltip-scrollbar-thumb     ((t (:background ,deep-ocean.colors.paleblue))))

  ;; Corfu
  `(corfu-default                       ((t (:foreground ,deep-ocean.editor.fg :background ,deep-ocean.editor.border))))
  `(corfu-current                       ((t (:foreground ,deep-ocean.editor.active :background ,deep-ocean.colors.accent))))
  `(completions-common-part             ((t (:foreground ,deep-ocean.editor.fg-dark :weight bold))))
  `(completions-first-difference        ((t (:foreground ,deep-ocean.colors.paleblue :weight bold))))

  ;; Org mode
  `(org-link                            ((t (:foreground ,deep-ocean.colors.paleblue))))
  `(org-level-1                         ((t (:foreground ,deep-ocean.colors.blue :weight bold))))
  `(org-level-2                         ((t (:foreground ,deep-ocean.colors.green :weight bold))))
  `(org-level-4                         ((t (:foreground ,deep-ocean.colors.darkgreen :weight bold))))

  ;; Syntax
  `(font-lock-comment-face              ((t (:foreground ,deep-ocean.syntax.comments))))
  `(font-lock-doc-face                  ((t (:foreground ,deep-ocean.syntax.comments))))
  `(font-lock-variable-name-face        ((t (:foreground ,deep-ocean.editor.fg))))
  `(font-lock-keyword-face              ((t (:foreground ,deep-ocean.colors.purple :weight bold))))
  `(font-lock-constant-face             ((t (:foreground ,deep-ocean.colors.yellow))))
  `(font-lock-string-face               ((t (:foreground ,deep-ocean.colors.green))))
  `(font-lock-type-face                 ((t (:foreground ,deep-ocean.colors.purple))))
  `(font-lock-function-name-face        ((t (:foreground ,deep-ocean.colors.blue))))
  `(font-lock-preprocessor-face         ((t (:foreground ,deep-ocean.colors.cyan))))

  ;; show-paren
  `(show-paren-mismatch                 ((t (:foreground ,deep-ocean.colors.darkred :weight bold))))
  `(show-paren-match                    ((t (:foreground ,deep-ocean.colors.darkblue :weight bold))))

  ;; Language specific styling
  `(rust-builtin-formatting-macro       ((t (:foreground ,deep-ocean.colors.cyan))))
  `(rust-unsafe                         ((t (:foreground ,deep-ocean.colors.red))))
  `(web-mode-html-tag-face              ((t (:foreground ,deep-ocean.colors.cyan))))
  `(web-mode-html-attr-name-face        ((t (:foreground ,deep-ocean.colors.purple))))
  ))

(provide-theme 'deep-ocean)
;;; deep-ocean-theme.el ends here
