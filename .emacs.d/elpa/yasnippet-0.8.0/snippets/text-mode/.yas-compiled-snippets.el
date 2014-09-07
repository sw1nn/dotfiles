;;; Compiled snippets and support files for `text-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'text-mode
		     '(("!" "#!/usr/bin/env `(let ((found (ca-all-asscs interpreter-mode-alist major-mode))) (if found (yas/choose-value found) \"\"))`$0" "bang" nil nil nil nil nil nil)
		       ("bash" "#!/bin/bash\n$0" "bash" nil nil nil nil nil nil)
		       ("code" ".. code:: ${1:python}" "code" nil nil nil nil nil nil)
		       ("email" "`(replace-regexp-in-string \"@\" \"@NOSPAM.\" user-mail-address)`" "(user's email)" nil nil nil nil nil nil)
		       ("fi" "`(ca-with-comment \"FIXME: \")`" "fixme" nil nil nil nil nil nil)
		       ("var" "`(ca-with-comment \"-*- ${1:var}: ${2:value} -*-\")`" "var" nil nil nil nil nil nil)
		       ("mode" "`(ca-with-comment \"-*- mode: ${1:mode} -*-\")`" "mode" nil nil nil nil nil nil)
		       ("rect" "<rect x=\"${1:1}\" y=\"${2:1}\" width=\"${3:1198}\" height=\"${4:398}\"\n        fill=\"${5:none}\" stroke=\"${6:blue}\" stroke-width=\"${7:2}\"/>\n" "rect" nil nil nil nil nil nil)
		       ("svg" "<svg width=\"${1:12}cm\" height=\"${2:4}cm\" viewBox=\"0 0 1200 400\"\n     xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\">\n\n     $0\n</svg>" "svg" nil nil nil nil nil nil)
		       ("switch" "switch (${1:var}) {\n       case ${2:0}:\n       $0\n       break;\n}\n" "switch" nil nil nil nil nil nil)
		       ("time" "`(current-time-string)`" "(current time)" nil nil nil nil nil nil)
		       ("t" "`(ca-with-comment \"TODO: \")`" "todo" nil nil nil nil nil nil)
		       ("x" "`(ca-with-comment \"XXX: \")`" "xxx" nil nil nil nil nil nil)))


;;; Do not edit! File generated at Thu Sep  4 09:32:11 2014
