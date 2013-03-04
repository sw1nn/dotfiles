{:user {:plugins [[lein-ritz "0.7.0"]]
        :jvm-opts ["-Xmx4G"]
        :injections [(require 'clojure.repl)]
        :warn-on-reflection true
        :dependencies [[ritz/ritz-nrepl-middleware "0.7.0"]
                       [ritz/ritz-debugger "0.7.0"]
                       [ritz/ritz-repl-utils "0.7.0"]
                       [clojure-complete "0.2.2"]]
        :repl-options {:nrepl-middleware 
                       [ritz.nrepl.middleware.javadoc/wrap-javadoc
                        ritz.nrepl.middleware.simple-complete/wrap-simple-complete]}
        :hooks [ritz.add-sources]}}
