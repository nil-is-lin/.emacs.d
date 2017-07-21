(use-package atom-dark
  :ensure t
  :init
  (load-theme 'atom-dark t)
  )

(use-package org-beautify
  :ensure t
  :init
  (load-theme 'org-beautify t)
  )

(setq inhibit-startup-screen nil)
(setq inhibit-startup-message t)

(global-linum-mode t)

(setq default-fill-column 70)

(show-paren-mode t)

(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)

(use-package better-defaults
  :ensure t)

(setq initial-major-mode 'lisp-interaction-mode)

(setq initial-scratch-message "\#这个缓冲区的内容不被保存，且处于lisp模式.\n\n")

(setq user-mail-address "1264747292@qq.com")

(setq user-full-name "李林")

(use-package org
  :ensure t)

(setq org-src-fontify-natively t)

(use-package grab-mac-link
  :ensure t
  :bind
  ("C-c g" . grab-mac-link))

(require 'chinese-fonts-setup)

(setq org-confirm-babel-evaluate nil)

(setq org-export-babel-evaluate t)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((shell . t)
   ))

(setenv "PATH" 
	(concat (getenv "PATH") 
		":/Library/TeX/texbin/"	;latex
		))
(setq exec-path 
      (append exec-path
	      '("/Library/TeX/texbin")
	      ))

;; (require 'org-latex)



(add-hook 'org-mode-hook 'turn-on-org-cdlatex)

; (load "auctex.el" nil t t)
; (load "preview.el" nil t t)

(setq Tex-auto-save t)
(setq Tex-parse-self t)

(setq-default Tex-master nil)

(setq global-font-lock-mode t)



(eval-after-load "ox-latex"
  '(add-to-list 'org-latex-classes
		`("beamer"
		  ,(concat "\\documentclass[presentation]{beamer}\n"
			   "[DEFAULT-PACKAGES]"
			   "[PACKAGES]"
			   "[EXTRA]\n")
		  ("\\section{%s}" . "\\section*{%s}")
		  ("\\subsection{%s}" . "\\subsection*{%s}")
		  ("\\subsubsection{%s}" . "\\subsubsection*{%s}"))))

(eval-after-load "org"
  '(require 'ox-md nil t))

(use-package elpy
  :ensure t)

(use-package py-autopep8
  :ensure t
  :config
  (add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save))

(use-package ein
  :ensure t
  :config
  (setq ein:use-auto-complete t)
  (setq ein:use-smartrep t))

(require 'ess-site)
(setq inferior-julia-program-name "/usr/local/bin/julia")

(add-hook 'org-babel-after-execute-hook 'org-display-inline-images)   
(add-hook 'org-mode-hook 'org-display-inline-images)
(add-to-list 'load-path "~/.emacs.d/lisp/")
(require 'ob-julia)
(load "~/.emacs.d/lisp/ob-julia.el")

(setq org-publish-project-alist
      '(("org-ianbarton"
	 ;; Path to your org files.
	 :base-directory "~/gitSpace/nil-is-lin.github.io/.org-source/"
	 :base-extension "org"

	 ;; Path to your Jekyll project.
	 :publishing-directory "~/gitSpace/nil-is-lin.github.io/_post/"
	 :recursive t
	 :publishing-function org-publish-org-to-html
	 :headline-levels 4 
	 :html-extension "html"
	 :body-only t ;; Only export section between <body> </body>
	 )

	("org-static-ian"
	 :base-directory "~/gitSpace/nil-is-lin.github.io/.org-source/"
	 :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf\\|php"
	 :publishing-directory "~/gitSpace/nil-is-lin.github.io/_post/"
	 :recursive t
	 :publishing-function org-publish-attachment)

	("ian" :components ("org-ianbarton" "org-static-ian"))
	))

(use-package magit
  :ensure t
  :bind ("C-x g" . magit-status))

(use-package flycheck
  :ensure t
  :config (global-flycheck-mode))

(use-package auto-complete
  :ensure t
  :config
  (setq ac-fuzzy-enable t) 		; 使用模糊功能
  (use-package auto-complete-config
    :ensure t
    :config
    (ac-config-default)))
