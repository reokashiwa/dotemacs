(setq default-directory "~/")
(setq command-line-default-directory "~/")

(setq display-time-string-forms
      '((format "%s/%s/%s(%s) %s:%s" year month day dayname 24-hours minutes)
	))
(display-time-mode 1)
(line-number-mode 1)
(column-number-mode 1)
(transient-mark-mode 1)

;; マウスで選択するとコピーする Emacs 24 ではデフォルトが nil
(setq mouse-drag-copy-region t)

;; Emacs23からprevious-lineとnext-lineの挙動がlogical lineの移動でなく
;; visual screen lineなので
(setq line-move-visual nil)

(setq exec-path (append exec-path '("/opt/local/bin")))

;; load-path
(setq load-path (cons "/opt/local/bin/" load-path))
(add-to-list 'load-path "~/.emacs.d/elisp/")

(defconst my-elisp-directory "~/.emacs.d/elisp" "The directory for my elisp file.")

(dolist (dir (let ((dir (expand-file-name my-elisp-directory)))
               (list dir (format "%s%d" dir emacs-major-version))))
  (when (and (stringp dir) (file-directory-p dir))
    (let ((default-directory dir))
      (add-to-list 'load-path default-directory)
      (normal-top-level-add-subdirs-to-load-path))))

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
  
;; 以下の設定はお好みで
(setq resize-mini-windows nil)
(setq mouse-drag-copy-region t)

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

      (when (string-match "babuyan" system-name)
	(add-to-list 'default-frame-alist '(font . "ricty-16"))
	(add-to-list 'initial-frame-alist '(width . 100))
	(setq initial-frame-alist '((height . 60)(left . 1000))) nil)
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
 '(package-selected-packages '(yatex wanderlust)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Wanderlust
(autoload 'wl "wl" "Wanderlust" t)
(autoload 'wl-other-frame "wl" "Wanderlust on new frame." t)
(autoload 'wl-draft "wl-draft" "Write draft with Wanderlust." )
;; (require 'w3m-load)
;;(require 'mime-w3m)
;;(setq w3m-command "/opt/local/bin/w3m")
;;(setq wl-icon-directory "/Users/reo/.emacs.d/elpa/wanderlust-20180506.128/icons")


;;
;; PATH
;;
(setenv "PATH" "/usr/local/texlive/2019/bin/x86_64-darwin:$PATH" t)
(setq exec-path (append '("/usr/local/texlive/2019/bin/x86_64-darwin") exec-path))
;;
;; YaTeX
;;
(autoload 'yatex-mode "yatex" "Yet Another LaTeX mode" t)
(setq auto-mode-alist
      (append '(("\\.tex$" . yatex-mode)
                ("\\.ltx$" . yatex-mode)
                ("\\.cls$" . yatex-mode)
                ("\\.sty$" . yatex-mode)
                ("\\.clo$" . yatex-mode)
                ("\\.bbl$" . yatex-mode)) auto-mode-alist))
(setq YaTeX-inhibit-prefix-letter t)
(setq YaTeX-kanji-code nil)
(setq YaTeX-latex-message-code 'utf-8)
(setq YaTeX-use-LaTeX2e t)
(setq YaTeX-use-AMS-LaTeX t)
(setq YaTeX-dvi2-command-ext-alist
      '(("TeXworks\\|texworks\\|texstudio\\|mupdf\\|SumatraPDF\\|Preview\\|Skim\\|TeXShop\\|evince\\|atril\\|xreader\\|okular\\|zathura\\|qpdfview\\|Firefox\\|firefox\\|chrome\\|chromium\\|MicrosoftEdge\\|microsoft-edge\\|Adobe\\|Acrobat\\|AcroRd32\\|acroread\\|pdfopen\\|xdg-open\\|open\\|start" . ".pdf")))
(setq tex-command "ptex2pdf -u -l -ot '-synctex=1'")
;(setq tex-command "lualatex -synctex=1")
;(setq tex-command "latexmk")
;(setq tex-command "latexmk -e '$latex=q/uplatex %O -synctex=1 %S/' -e '$bibtex=q/upbibtex %O %B/' -e '$biber=q/biber %O --bblencoding=utf8 -u -U --output_safechars %B/' -e '$makeindex=q/upmendex %O -o %D %S/' -e '$dvipdf=q/dvipdfmx %O -o %D %S/' -norc -gg -pdfdvi")
;(setq tex-command "latexmk -e '$lualatex=q/lualatex %O -synctex=1 %S/' -e '$bibtex=q/upbibtex %O %B/' -e '$biber=q/biber %O --bblencoding=utf8 -u -U --output_safechars %B/' -e '$makeindex=q/upmendex %O -o %D %S/' -norc -gg -pdflua")
(setq bibtex-command "latexmk -e '$latex=q/uplatex %O -synctex=1 %S/' -e '$bibtex=q/upbibtex %O %B/' -e '$biber=q/biber %O --bblencoding=utf8 -u -U --output_safechars %B/' -e '$makeindex=q/upmendex %O -o %D %S/' -e '$dvipdf=q/dvipdfmx %O -o %D %S/' -norc -gg -pdfdvi")
(setq makeindex-command "latexmk -e '$latex=q/uplatex %O -synctex=1 %S/' -e '$bibtex=q/upbibtex %O %B/' -e '$biber=q/biber %O --bblencoding=utf8 -u -U --output_safechars %B/' -e '$makeindex=q/upmendex %O -o %D %S/' -e '$dvipdf=q/dvipdfmx %O -o %D %S/' -norc -gg -pdfdvi")
(setq dvi2-command "open -a Skim")
;(setq dvi2-command "open -a Preview")
;(setq dvi2-command "open -a TeXShop")
;(setq dvi2-command "/Applications/TeXworks.app/Contents/MacOS/TeXworks")
;(setq dvi2-command "/Applications/texstudio.app/Contents/MacOS/texstudio --pdf-viewer-only")
(setq tex-pdfview-command "open -a Skim")
;(setq tex-pdfview-command "open -a Preview")
;(setq tex-pdfview-command "open -a TeXShop")
;(setq tex-pdfview-command "/Applications/TeXworks.app/Contents/MacOS/TeXworks")
;(setq tex-pdfview-command "/Applications/texstudio.app/Contents/MacOS/texstudio --pdf-viewer-only")
(setq dviprint-command-format "open -a \"Adobe Acrobat Reader DC\" `echo %s | gsed -e \"s/\\.[^.]*$/\\.pdf/\"`")

(add-hook 'yatex-mode-hook
          '(lambda ()
             (auto-fill-mode -1)))

;;
;; RefTeX with YaTeX
;;
;(add-hook 'yatex-mode-hook 'turn-on-reftex)
(add-hook 'yatex-mode-hook
          '(lambda ()
             (reftex-mode 1)
             (define-key reftex-mode-map (concat YaTeX-prefix ">") 'YaTeX-comment-region)
             (define-key reftex-mode-map (concat YaTeX-prefix "<") 'YaTeX-uncomment-region)))
