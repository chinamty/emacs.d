;; init utils


;;  after load 最主要的作用是提供了一个宏after-load，供后续的各初始化函数使用。
;;  这个函数来自Purcell，目的是把一些相互依赖的feature的加载顺序理顺，例如feature
;;  A依赖于feature B，则可以写成(after-load 'B 'A)，这样如果错误地在B之前require了A也不会影响正常启动。
(defmacro after-load (feature &rest body)
  "After FEATURE is loaded, evaluate BODY."
  (declare (indent defun))
  `(eval-after-load ,feature
     '(progn ,@body)))

(provide 'init-utlis)
