(when (memq window-system '(mac ns))
  (global-set-key [s-mouse-1] 'browse-url-at-mouse)

  ;; Ricty
  (set-face-attribute 'default nil
		      :family "Ricty Discord"
		      :height 120)
  (set-fontset-font (frame-parameter nil 'font)
		    'japanese-jisx0208
		    (cons "Ricty Discord" "iso10646-1"))
  (set-fontset-font (frame-parameter nil 'font)
		    'japanese-jisx0212
		    (cons "Ricty Discord" "iso10646-1"))
  (set-fontset-font (frame-parameter nil 'font)
		    'katakana-jisx0201
		    (cons "Ricty Discord" "iso10646-1"))
  (setq frame-inherited-parameters '(font tool-bar-lines))
  )

;; MacのcommandキーをMetaキー扱いにする
(setq ns-command-modifier (quote meta))
(setq ns-alternate-modifier (quote super))


(if window-system
    (progn
      ;; 文字の色を設定します。
      (add-to-list 'default-frame-alist '(foreground-color . "gray10"))
		    ;; 背景色を設定します。
      (add-to-list 'default-frame-alist '(background-color . "white"))
      ;; カーソルの色を設定します。
      (add-to-list 'default-frame-alist '(cursor-color . "SlateBlue2"))
      ;; マウスポインタの色を設定します。
      (add-to-list 'default-frame-alist '(mouse-color . "SlateBlue2"))
      ;; モードラインの文字の色を設定します。
      (set-face-foreground 'mode-line "white")
      ;; モードラインの背景色を設定します。
      (set-face-background 'mode-line "MediumPurple2")
      ;; 選択中のリージョンの色を設定します。
      (set-face-background 'region "LightSteelBlue1")
      ;; モードライン（アクティブでないバッファ）の文字色を設定します。
      (set-face-foreground 'mode-line-inactive "gray30")
      ;; モードライン（アクティブでないバッファ）の背景色を設定します。
      (set-face-background 'mode-line-inactive "gray85")

      ;; for source code
      (set-face-foreground 'font-lock-comment-face "MediumSeaGreen")
      (set-face-foreground 'font-lock-string-face  "purple")
      (set-face-foreground 'font-lock-keyword-face "blue")
      (set-face-foreground 'font-lock-function-name-face "blue")
      (set-face-bold-p 'font-lock-function-name-face t)
      (set-face-foreground 'font-lock-variable-name-face "black")
      (set-face-foreground 'font-lock-type-face "LightSeaGreen")
      (set-face-foreground 'font-lock-builtin-face "purple")
      (set-face-foreground 'font-lock-constant-face "black")
      (set-face-foreground 'font-lock-warning-face "blue")
      (set-face-bold-p 'font-lock-warning-face nil)

      ;; ウィンドウ位置・大きさの指定
      (add-to-list 'initial-frame-alist '(width . 100))
      (add-to-list 'initial-frame-alist '(top . 0))
      (if (string-match "visayas" system-name)
	  (setq initial-frame-alist '((height . 61)(left . 1120))))
      (when (string-match "agalega" system-name)
	(add-to-list 'default-frame-alist '(font . "ricty-16"))
	(setq initial-frame-alist '((height . 68)(left . 1220))) nil)
      (when (string-match "samar" system-name)
	(add-to-list 'default-frame-alist '(font . "ricty-16"))
	(setq initial-frame-alist '((height . 84)(left . 1880))) nil)
      (when (string-match "balleny" system-name)
	(add-to-list 'default-frame-alist '(font . "ricty-14"))
	(setq initial-frame-alist '((height . 53)(left . 840))) nil)
      (when (string-match "chatham" system-name)
	(add-to-list 'default-frame-alist '(font . "ricty-16"))
	(setq initial-frame-alist '((height . 60)(left . 1000))) nil)

      (when (string-match "dhcp171-128.rall" system-name)
	(add-to-list 'default-frame-alist '(font . "ricty-16"))
	(add-to-list 'initial-frame-alist '(width . 100))
	(setq initial-frame-alist '((height . 94)(left . 3000))) nil)
      ))

(set-language-environment "Japanese")
(set-clipboard-coding-system 'sjis-mac)
(set-buffer-file-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-scroll-bar-mode 'right) ;; 右側

;; デフォルトの透明度を設定する (85%)
(add-to-list 'default-frame-alist '(alpha . 85))

;; カレントウィンドウの透明度を変更する (85%)
; (set-frame-parameter nil 'alpha 0.85)
(set-frame-parameter nil 'alpha 90)

;; package
(require 'package)

;; MELPAを追加
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

;; MELPA-stableを追加
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)

;; Marmaladeを追加
(add-to-list 'package-archives  '("marmalade" . "http://marmalade-repo.org/packages/") t)

;; Orgを追加
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)

;; 初期化
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(wanderlust)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
