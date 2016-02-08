(deftheme andrej                                                    
  "Created 2016-02-08.")

(custom-theme-set-faces
 'andrej

 '(cursor
   ((t (:background "chocolate1"))))

 '(fixed-pitch
   ((t (:family "Terminus"))))

 '(variable-pitch
   ((t (:family "Terminus"))))

 '(escape-glyph
   ((((background dark)) (:foreground "cyan"))
    (((type pc)) (:foreground "magenta"))
    (t (:foreground "brown"))))
 
 '(minibuffer-prompt
   ((((background dark))
     (:foreground "cyan"))
    (((type pc))
     (:foreground "magenta"))
    (t (:foreground "medium blue"))))

 '(highlight
   ((((class color)
      (min-colors 88)
      (background light))
     (:background "darkseagreen2"))
    (((class color) (min-colors 88)
      (background dark))
     (:background "darkolivegreen"))
    (((class color) (min-colors 16) (background light))
     (:background "darkseagreen2"))
    (((class color)
      (min-colors 16) (background dark))
     (:background "darkolivegreen"))
    (((class color) (min-colors 8))
     (:foreground "black" :background "green"))
    (t (:inverse-video t))))

 '(region
   ((((class color) (min-colors 88) (background dark))
     (:background "blue3")) (((class color) (min-colors 88)
                              (background light) (type gtk))
                             (:background "gtk_selection_bg_color"
                                          :distant-foreground
                                          "gtk_selection_fg_color"))
     (((class color) (min-colors 88) (background light) (type ns))
      (:background "ns_selection_bg_color" :distant-foreground
                   "ns_selection_fg_color"))
     (((class color) (min-colors 88)
       (background light))
             (:background "lightgoldenrod2"))
     (((class color) (min-colors 16) (background dark))
      (:background "blue3"))
     (((class color) (min-colors 16) (background light))
      (:background "lightgoldenrod2"))
     (((class color) (min-colors 8))
      (:foreground "white" :background "blue"))
     (((type tty) (class mono)) (:inverse-video t)) (t
                                                     (:background
                                                      "gray"))))
 '(shadow
   ((((class color grayscale) (min-colors 88) (background light))
     (:foreground "grey50"))
    (((class color grayscale) (min-colors 88) (background dark))
     (:foreground "grey70"))
    (((class color) (min-colors 8)
      (background light))
     (:foreground "green")) (((class color) (min-colors 8)
                              (background dark))
                             (:foreground "yellow"))))
 '(secondary-selection
   ((((class color) (min-colors 88)
      (background light))
     (:background "yellow1"))
    (((class color) (min-colors 88)
      (background dark))
     (:background "SkyBlue4")) (((class color)
                                 (min-colors 16)
                                 (background light))
                                (:background "yellow"))
     (((class color) (min-colors 16) (background dark))
      (:background "SkyBlue4"))
     (((class color) (min-colors 8))
      (:foreground "black" :background "cyan"))
     (t (:inverse-video t))))

 '(trailing-whitespace ((t (:background "gray25"))))

 '(font-lock-builtin-face ((t (:foreground "aquamarine"))))

 '(font-lock-comment-delimiter-face ((t (:inherit font-lock-comment-face))))

 '(font-lock-comment-face ((t (:foreground "chocolate1"))))

 '(font-lock-constant-face
   ((((class grayscale)
      (background light))
     (:underline (:color foreground-color :style line)
                 :weight bold :foreground "LightGray"))
    (((class grayscale)
      (background dark)) (:underline
                          (:color foreground-color :style line)
                          :weight bold
                          :foreground "Gray50"))
    (((class color) (min-colors 88) (background light))
     (:foreground "dark cyan"))
    (((class color) (min-colors 88) (background dark))
     (:foreground "Aquamarine"))
    (((class color) (min-colors 16) (background light))
     (:foreground "CadetBlue"))
    (((class color) (min-colors 16) (background dark))
     (:foreground "Aquamarine")) (((class color) (min-colors 8))
                                  (:foreground "magenta"))
     (t (:underline (:color foreground-color :style line) :weight bold))))

 '(font-lock-doc-face ((t (:inherit (font-lock-string-face)))))

 '(font-lock-function-name-face
   ((((class color) (min-colors 88) (background light))
     (:foreground "Blue1"))
    (((class color) (min-colors 88) (background dark))
     (:foreground "LightSkyBlue"))
    (((class color) (min-colors 16) (background light))
     (:foreground "Blue"))
    (((class color) (min-colors 16) (background dark))
     (:foreground "LightSkyBlue")) (((class color) (min-colors 8))
                                    (:weight bold :foreground "blue"))
     (t (:weight bold :inverse-video t))))
 
 '(font-lock-keyword-face
   ((((class grayscale) (background light))
     (:weight bold :foreground "LightGray"))
    (((class grayscale) (background dark))
     (:weight bold :foreground "DimGray"))
    (((class color) (min-colors 88) (background light))
     (:foreground "Purple")) (((class color) (min-colors 88)
                               (background dark))
                              (:foreground "Cyan1"))
     (((class color) (min-colors 16) (background light))
      (:foreground "Purple"))
     (((class color) (min-colors 16) (background dark))
      (:foreground "Cyan")) (((class color) (min-colors 8))
                             (:weight bold :foreground "cyan"))
      (t (:weight bold))))
 
 '(font-lock-negation-char-face ((t nil)))

 '(font-lock-preprocessor-face ((t (:inherit (font-lock-builtin-face)))))

 '(font-lock-regexp-grouping-backslash ((t (:inherit (bold)))))

 '(font-lock-regexp-grouping-construct ((t (:inherit (bold)))))

 '(font-lock-string-face
   ((((class grayscale) (background light))
     (:slant italic :foreground "DimGray"))
    (((class grayscale) (background dark))
     (:slant italic :foreground "LightGray"))
    (((class color) (min-colors 88) (background light))
     (:foreground "VioletRed4"))
    (((class color) (min-colors 88) (background dark))
     (:foreground "LightSalmon")) (((class color) (min-colors 16)
                                    (background light))
                                   (:foreground "RosyBrown"))
     (((class color) (min-colors 16) (background dark))
      (:foreground "LightSalmon")) (((class color)
                                     (min-colors 8))
                                    (:foreground "green"))
      (t (:slant italic))))
 
 '(font-lock-type-face
   ((((class grayscale) (background light))
     (:weight bold :foreground "Gray90"))
    (((class grayscale) (background dark))
     (:weight bold :foreground "DimGray"))
    (((class color) (min-colors 88) (background light))
     (:foreground "ForestGreen"))
    (((class color) (min-colors 88) (background dark))
     (:foreground "PaleGreen"))
    (((class color) (min-colors 16) (background light))
     (:foreground "ForestGreen"))
    (((class color) (min-colors 16) (background dark))
     (:foreground "PaleGreen"))
    (((class color) (min-colors 8)) (:foreground "green"))
    (t (:underline (:color foreground-color :style line) :weight bold))))

 '(font-lock-variable-name-face
   ((((class grayscale) (background light))
     (:slant italic :weight bold :foreground "Gray90"))
    (((class grayscale) (background dark))
     (:slant italic :weight bold :foreground "DimGray"))
    (((class color) (min-colors 88) (background light))
     (:foreground "sienna"))
    (((class color) (min-colors 88) (background dark))
     (:foreground "LightGoldenrod"))
    (((class color) (min-colors 16) (background light))
     (:foreground "DarkGoldenrod"))
    (((class color) (min-colors 16) (background dark))
     (:foreground "LightGoldenrod"))
    (((class color) (min-colors 8))
     (:weight light :foreground "yellow"))
    (t (:slant italic :weight bold))))

 '(font-lock-warning-face ((t (:inherit (error)))))

 '(button ((t (:inherit (link)))))

 '(link
   ((((class color) (min-colors 88) (background light))
     (:underline
      (:color foreground-color :style line) :foreground "RoyalBlue3"))
    (((class color) (background light))
     (:underline (:color foreground-color :style line) :foreground "blue"))
    (((class color) (min-colors 88) (background dark))
     (:underline
      (:color foreground-color :style line) :foreground "cyan1"))
    (((class color) (background dark))
     (:underline (:color foreground-color :style line)
                 :foreground "cyan")) (t (:inherit (underline)))))

 '(link-visited
   ((default
      (:inherit (link))) (((class color) (background light))
                          (:foreground "magenta4"))
      (((class color) (background dark))
       (:foreground "violet"))))
 
 '(fringe
   ((((class color) (background light))
     (:background "grey95"))
    (((class color) (background dark))
     (:background "grey10"))
    (t (:background "gray"))))

 '(header-line
   ((default
      (:inherit (mode-line)))
    (((type tty))
     (:underline (:color foreground-color :style line) :inverse-video nil))
    (((class color grayscale) (background light))
     (:box nil :foreground "grey20" :background "grey90"))
    (((class color grayscale) (background dark))
     (:box nil :foreground "grey90" :background "grey20"))
    (((class mono) (background light))
     (:underline (:color foreground-color :style line)
                 :box nil :inverse-video nil
                 :foreground "black" :background "white"))
    (((class mono) (background dark))
     (:underline (:color foreground-color :style line)
                 :box nil :inverse-video nil
                 :foreground "white" :background "black"))))

 '(tooltip
   ((((class color))
     (:inherit (variable-pitch) :foreground "black"
               :background "lightyellow")) (t (:inherit (variable-pitch)))))

 '(mode-line
   ((((class color) (min-colors 88))
     (:foreground "black" :background "grey75"
                  :box (:line-width -1 :color nil
                                    :style released-button)))
    (t (:inverse-video t))))

 '(mode-line-buffer-id ((t (:weight bold))))

 '(mode-line-emphasis ((t (:weight bold))))

 '(mode-line-highlight
   ((((class color)
      (min-colors 88)) (:box
                        (:line-width 2 :color "grey40"
                                     :style released-button)))
    (t (:inherit (highlight)))))

 '(mode-line-inactive
   ((default
      (:inherit (mode-line)))
    (((class color) (min-colors 88) (background light))
     (:background "grey90" :foreground "grey20"
                  :box (:line-width -1 :color "grey75" :style nil)
                  :weight light))
    (((class color) (min-colors 88) (background dark))
     (:background "grey30" :foreground "grey80"
                  :box (:line-width -1 :color "grey40" :style nil)
                  :weight light))))

 '(isearch
   ((((class color) (min-colors 88) (background light))
     (:foreground "lightskyblue1" :background "magenta3"))
    (((class color) (min-colors 88) (background dark))
     (:foreground "brown4" :background "palevioletred2"))
    (((class color) (min-colors 16))
     (:foreground "cyan1" :background "magenta4"))
    (((class color) (min-colors 8))
     (:foreground "cyan1" :background "magenta4")) (t (:inverse-video t))))

 '(isearch-fail
   ((((class color) (min-colors 88) (background light))
     (:background "RosyBrown1"))
    (((class color) (min-colors 88) (background dark))
     (:background "red4")) (((class color)
                             (min-colors 16)) (:background "red"))
     (((class color) (min-colors 8)) (:background "red"))
     (((class color grayscale)) (:foreground "grey")) (t (:inverse-video t))))

 '(lazy-highlight
   ((((class color) (min-colors 88) (background light))
     (:background "paleturquoise"))
    (((class color) (min-colors 88) (background dark))
     (:background "paleturquoise4"))
    (((class color) (min-colors 16))
     (:background "turquoise3")) (((class color) (min-colors 8))
                                  (:background "turquoise3"))
     (t (:underline (:color foreground-color :style line)))))

 '(match
   ((((class color) (min-colors 88) (background light))
     (:background "yellow1"))
    (((class color) (min-colors 88) (background dark))
     (:background "RoyalBlue3"))
    (((class color) (min-colors 8) (background light))
     (:foreground "black" :background "yellow"))
    (((class color) (min-colors 8) (background dark))
     (:foreground "white" :background "blue"))
    (((type tty) (class mono)) (:inverse-video t)) (t (:background "gray"))))

 '(next-error ((t (:inherit (region)))))

 '(query-replace ((t (:inherit (isearch)))))

 '(default
    ((t (:background "grey5"
                     :foreground "grey85"
                     :slant normal :weight normal
                     :height 90 :width normal :foundry "unknown"
                     :family "Terminus"))))

 '(magit-diff-added-highlight ((t (:foreground "DarkOliveGreen1" :background "dark olive green"))))
 '(magit-diff-removed-highlight ((t (:foreground "IndianRed1" :background "brown4"))))
 '(magit-diff-lines-heading ((t (:foreground "black" :background "cyan"))))
 )

(provide-theme 'andrej)