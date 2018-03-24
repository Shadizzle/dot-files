(defun buffer-state-* ()
  (cond (buffer-read-only "·")
        ((buffer-modified-p) "*")
        (t "-")))

(defun buffer-state-+ ()
  (cond ((buffer-modified-p) "*")
        (buffer-read-only "·")
        (t "-")))

(defun aligned-mode-line (left-pad left center right right-pad)
  (let* ((left-pad-f  `(format-mode-line ,left-pad))
         (left-f      `(format-mode-line ,left))
         (center-f    `(format-mode-line ,center))
         (right-f     `(format-mode-line ,right))
         (right-pad-f `(format-mode-line ,right-pad))
         (available `(/ (- (window-width) (length ,center-f)) 2))
         (available `(if (cl-oddp ,available)
                         (+ 1 ,available)
                         ,available))
         (left      `(if (> (length ,left-f) (+ 1 ,available))
                         (concat (seq-take ,left-f (- ,available 3)) "... ")
                         ,left-f))
         (right     `(if (> (length ,right-f) (+ 1 ,available))
                         (concat (seq-take ,right-f (- ,available 3)) "... ")
                         ,right))
         (left-space  `(make-list (- ,available (length ,left-f) (length ,left-pad-f)) " "))
         (right-space `(make-list (- ,available (length ,right-f) (length ,right-pad-f)) " ")))
    (setq-default mode-line-format
                  `((:eval ,left-pad)
                    (:eval ,left)
                    (:eval ,left-space)
                    (:eval ,center)
                    (:eval ,right-space)
                    (:eval ,right)
                    (:eval ,right-pad)))))