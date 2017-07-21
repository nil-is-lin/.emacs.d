;;; .init.el 开始  --- 删掉 .emacs 后，首先加载的就是本文件
;; 参考 http://orgmode.org/worg/org-contrib/babel/intro.html#literate-programming
;; 这里配置它支持 Org-mode, 其余的 Emacs配置文件放在文学式的 org-mode 文件中

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 使用Melpa安装，添加到package-archives
;;;;;;;;;;;;;;;
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/") t)
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (helm-gtags try ein elpy auto-complete-config auto-complete flycheck grab-mac-link org-beautify atom-dark use-package projectile auctex ace-flyspell adjust-parens copy-as-format dumb-jump org-preview-html org-ref org-page org-journal org-dp org-dotemacs org-chinese-utils org-beautify-theme o-blog chinese-fonts-setup ox-latex-chinese markdown-mode auto-org-md julia-shell julia-mode magithub magit ggtags org))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(require 'org)				; 加载org-mode
(require 'ob-tangle)			; 加载org-babel
(org-babel-load-file "~/.emacs.d/dotemacs.org")
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; init.el 结束
