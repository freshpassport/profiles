;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here

;; Golang
(add-hook! go-mode
  (setq gofmt-command "goimports")
  (add-hook 'before-save-hook 'gofmt-before-save))

(defun +my/better-font()
  (interactive)
  ;; english font
  (if (display-graphic-p)
      (progn
        ;;(set-face-attribute 'default nil :font (format "%s:pixelsize=%d" "PT Mono" 14)) ;; 11 13 17 19 23
        ;;(set-face-attribute 'default nil :font (format "%s:pixelsize=%d" "Droid Sans Mono for Powerline" 14)) ;; 11 13 17 19 23
        ;;(set-face-attribute 'default nil :font (format "%s:pixelsize=%d" "Fira Code Light" 13)) ;; 11 13 17 19 23
        ;;(set-face-attribute 'default nil :font (format "%s:pixelsize=%d" "Meslo LG S DZ for Powerline" 13)) ;; 11 13 17 19 23
        ;;;;(set-face-attribute 'default nil :font (format "%s:pixelsize=%d" "Victor Mono Light" 14)) ;; 11 13 17 19 23
        (set-face-attribute 'default nil :font (format "%s:pixelsize=%d" "saxMono" 14)) ;; 11 13 17 19 23
        ;; chinese font
        (dolist (charset '(kana han symbol cjk-misc bopomofo))
          (set-fontset-font (frame-parameter nil 'font)
                            charset
                            (font-spec :family "PingFangSC-Thin")))) ;; 14 16 20 22 28
                            ;;(font-spec :family "Sarasa Mono SC")))) ;; 14 16 20 22 28
    ))

(defun +my|init-font(frame)
  (with-selected-frame frame
    (if (display-graphic-p)
        (+my/better-font))))

(if (and (fboundp 'daemonp) (daemonp))
    (add-hook 'after-make-frame-functions #'+my|init-font)
  (+my/better-font))

