(require 'package)
(add-to-list 'package-archives 
             '("gnu" . "https://elpa.gnu.org/packages/"))
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(require 'gnutls)
(add-to-list 'gnutls-trustfiles "/usr/local/etc/openssl/cert.pem")
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/plugin/laes")
(require 'leetcode)
(setq lc-user-name-email "freshpassport@gmail")
(setq lc-user-password "qwerty123")
(setq lc-perfer-lang "c")

(require 'calfw)

(add-hook 'after-init-hook 'global-company-mode)
;;(use-package company-tabnine :ensure t)

;; Theme
(load-theme 'atom-one-dark t)

;; Basic Config
(tool-bar-mode 0)   ;; 关闭工具栏
(scroll-bar-mode 0) ;; 关闭滚动条
(setq inhibit-startup-message t) ;; 关闭启动画面
(global-hl-line-mode 1)          ;; 高亮当前行
(global-set-key (kbd "M-g") 'goto-line) ;; 跳转到指定行
(global-set-key "%" 'match-paren) ;; 使用%在括号之间跳转
(global-set-key (kbd "C-c C-b") 'comment-or-uncomment-region) ;; 注释与反注释
(global-set-key (kbd "C-x y") 'copy-line)

(defun match-paren (arg)
"Go to the matching paren if on a paren; otherwise insert %."
(interactive "p")
(cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
((looking-at "\\s\)") (forward-char 1) (backward-list 1))
(t (self-insert-command (or arg 1)))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun goto-match (arg)
  (interactive "p")
  (let ((stop nil) (c 1) (p-save (point)) (forward t) (self "") (target ""))
    (cond ((looking-at "}") (setq forward nil) (setq self "}") (setq target "{"))
          ((looking-at "{") (setq forward t)   (setq self "{") (setq target "}"))
          ((looking-at ")") (setq forward nil) (setq self ")") (setq target "("))
          ((looking-at "(") (setq forward t)   (setq self "(") (setq target ")"))
          ((looking-at ">") (setq forward nil) (setq self ">") (setq target "<"))
          ((looking-at "<") (setq forward t)   (setq self "<") (setq target ">"))
          ((looking-at "\\]") (setq forward nil) (setq self "\\]") (setq target "\\["))
          ((looking-at "\\[") (setq forward t)   (setq self "\\[") (setq target "\\]"))
          (t (setq stop t) (setq c -1)))
    (while (not stop)
      (progn
        (if forward (forward-char 1) (backward-char 1))
        (cond ((looking-at target) (setq c (1- c)))
              ((looking-at self) (setq c (1+ c))))
        (if (or (= c 0) (= (point) (point-max))) (setq stop t))))
    (if (= c -1) (self-insert-command (or arg 1)))
    (if (> c 0) (goto-char p-save))))


;; 配置显示时间日期
(display-time-mode 1)              ;; 显示时间
(setq display-time-24hr-format t)  ;; 24时方式显示
(setq display-time-day-and-date t) ;; 显示日期

;; 文件编辑
(global-linum-mode 1)     ;; 显示行号
(setq linum-format "%d ") ;; 行号格式
;;(setq tab-width 4)        ;; TAB缩进
;;(c-set-style "ellemtel")
;;(setq c-default-style "elemtel" c-basic-offset 4)
;;(setq tab-width 4 indent-tabs-mode nil)

(setq-default tab-width 4)
;;(setq-default indent-tabs-mode nil)
;;(setq c-default-style "Linux")
;;(setq c-basic-offset 4)

;; Golang
;(require 'go-mode)
;(require 'go-guru)
;(add-hook 'before-save-hook #'gofmt-before-save)
(require 'lsp-mode)
(add-hook 'go-hook-mode #'lsp)
 '(lsp-before-save-edits t)
;; optional - provides fancier overlays
;;(use-package lsp-ui
;;  :commands lsp-ui-mode)
;; if you use company-mode for completion (otherwise, complete-at-point works out of the box):
;;(use-package company-lsp
;;  :commands company-lsp)
;;(require 'company-lsp)
;;(push 'company-lsp company-backends)

;;(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-env "PATH")
  (exec-path-from-shell-copy-env "GOROOT")


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(display-battery-mode t)
 '(display-time-mode t)
 '(package-selected-packages
   (quote
	(use-package dracula-theme company-jedi flymake-python-pyflakes ggtags elpy company-lsp lsp-ui lsp-mode calfw vue-mode go-guru request exec-path-from-shell atom-one-dark-theme go-mode)))
 '(size-indication-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; python
; Enable flycheck.
;(add-hook 'python-mode-hook #'flycheck-mode)
;(setq flycheck-python-flake8-executable "/usr/bin/flake8")
; Disable pylint, and force use of flake8 instead.
;(add-to-list 'flycheck-disabled-checkers 'python-pylint)
;(add-hook 'python-mode-hook
;  (lambda () (flycheck-select-checker 'python-flake8)))
;(use-package company-jedi
;  :ensure t)
;(add-hook 'python-mode-hook
;  (lambda ()
										;    (company-mode 1)))
;; flycheck
(add-hook 'python-mode-hook
  (lambda ()
    (company-mode 1)))

;; flake8
(require 'flymake-python-pyflakes)
(add-hook 'python-mode-hook 'flymake-python-pyflakes-load)

;; jedi
(require 'company-jedi)
;; Basic usage.
;(add-to-list 'company-backends 'company-jedi)
;; Advanced usage.
;(add-to-list 'company-backends '(company-jedi company-files))
