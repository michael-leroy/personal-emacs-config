;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(require 'package)
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (sanityinc-solarized-dark)))
 '(custom-safe-themes
   (quote
    ("4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(package-archives
   (quote
    (("melpa-stable" . "https://stable.melpa.org/packages/")
     ("gnu" . "http://elpa.gnu.org/packages/"))))
 '(package-selected-packages
   (quote
    (evil-magit use-package sublimity solarized-theme smex python-mode puppet-mode paradox magit jedi hackernews flymake-jslint flycheck-yamllint flycheck-pycheckers evil el-get company color-theme-sanityinc-solarized)))
 '(paradox-github-token t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Set window frame size on startup.
(when window-system (set-frame-size (selected-frame) 130 50))

;; package-refresh-contents is needed so packages install properly
;; on startup.
(package-refresh-contents)

;; packages I use are defined here.
(setq package-list '(
    use-package
    paradox
    auto-complete
    color-theme-sanityinc-solarized
    company
    concurrent
    ctable
    dash
    deferred
    el-get
    epc
    epl
    hydra
    jedi
    jedi-core
    let-alist
    pkg-info
    popup
    puppet-mode
    python-environment
    python-mode
    seq
    solarized-theme
    spinner
    sublimity
    hackernews
    smex
    flycheck
    flycheck-pycheckers
    flycheck-yamllint
    flymake-jslint
    magit
    evil
    evil-magit
    ))


;; If a package is not installed, install it.
(dolist (package package-list)
  (when (not (package-installed-p package))
    (package-install package)))

;; Enable Auto-complete
(add-hook 'text-mode-hook #'auto-complete-mode 1)
(add-hook 'prog-mode-hook #'auto-complete-mode 1)

;; Setup Evil Mode 666
(require 'evil)
;;(require 'evil-magit)
(evil-mode 1)

;; Setup sublimity mode.
(require 'sublimity)
(require 'sublimity-scroll)
(require 'sublimity-map)
(add-hook 'text-mode-hook #'sublimity-mode 1)
(add-hook 'prog-mode-hook #'sublimity-mode 1)

;; Setup theme to start after init.
(add-hook 'after-init-hook (lambda () (load-theme 'sanityinc-solarized-dark t)))

;; Setup python code completion via Jedi after init.
(add-hook 'after-init-hook (lambda () (add-hook 'python-mode-hook 'jedi:setup)))

;; Enable Ido mode for improved file/buffer opening.
(require 'ido)
(ido-mode t)


;; Set hotkeys for smex to replace execute-extended command aka M-x
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; Enable syntax highlighting
(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))
