{:user {:plugins [[lein-ritz "0.7.0"]
                  [lein-midje "3.0.0"]
                  [lein-marginalia "0.7.1"]]
        :jvm-opts ["-Xmx4G"]
        :injections [(try (require 'spyscope.core)
                       (catch RuntimeException e)) ;; try-catch to workaround lein repl outside workspace
                     (require 'clojure.repl)
                     (require 'clojure.pprint)
                     (require 'alembic.still)]
        ;; :warn-on-reflection true
        :dependencies [
;                       [ritz/ritz-nrepl-middleware "0.7.0"]
;                       [ritz/ritz-debugger "0.7.0"]
;                       [ritz/ritz-repl-utils "0.7.0"]
                       [clojure-complete "0.2.2"]
                       [spyscope "0.1.3"]
                       [alembic "0.1.0"]
                      ]
;        :repl-options {:nrepl-middleware
;                       [ritz.nrepl.middleware.javadoc/wrap-javadoc
;                        ritz.nrepl.middleware.simple-complete/wrap-simple-complete]
;                       :host "0.0.0.0"
;                       :port 4001}
 }}
