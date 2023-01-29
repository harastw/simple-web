(defparameter *server* (make-instance 'tbnl:easy-acceptor
				      :port 33333
				      :address "0.0.0.0"))

(defun start-serv ()
  (tbnl:start *server*))

(defparameter *css*
  '((body
     :background-color "yellow")))

(tbnl:define-easy-handler (main :uri  "/")
    (name)
  (spinneret:with-html-string
    (:html
     (:head
      (:style
       (apply #'lass:compile-and-write *css*)))
     (:body
      (:div :class "wrapper"
	    (:h1 "Youtube")
	    (if name
	    (:p (format NIL "Hi, ~A" name))
	    (:p "No name :(")))))))
