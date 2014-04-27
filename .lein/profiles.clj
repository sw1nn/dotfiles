{:user {:plugins      [[lein-ritz "0.7.0"]
                       [lein-midje "3.0.0"]
                       [lein-marginalia "0.7.1"]
                       [lein-try "0.2.0"]
                       [lein-ancient "0.5.4"]
                       [jonase/eastwood "0.1.0"]
                       ]
        :jvm-opts     ["-Xmx4G"]
        :injections   [
                       (try (require 'spyscope.core)
                            (catch RuntimeException e)) ;; try-catch to workaround lein repl outside workspace
                       (let [orig (ns-resolve (doto 'clojure.stacktrace require)
                                              'print-cause-trace)
                             new (ns-resolve (doto 'clj-stacktrace.repl require)
                                             'pst)]
                         (alter-var-root orig (constantly @new)))
                       (require 'clojure.repl)
                       (require 'clojure.pprint)
                       (require 'alembic.still)
                       (require 'pjstadig.humane-test-output)
                       ]
        ;; :warn-on-reflection true
        :dependencies [
                       [clj-stacktrace "0.2.5"]
                       [clojure-complete "0.2.3"]
                       [pjstadig/humane-test-output "0.3.0"]
                       [spyscope "0.1.3"]
                       [slamhound "1.3.3"]
                       [alembic "0.2.0"]
                       [cider/cider-nrepl "0.6.0"]
                       ]

        :repl-options {:nrepl-middleware
                       [cider.nrepl.middleware.classpath/wrap-classpath
                        cider.nrepl.middleware.complete/wrap-complete
                        cider.nrepl.middleware.info/wrap-info
                        cider.nrepl.middleware.inspect/wrap-inspect
                        cider.nrepl.middleware.stacktrace/wrap-stacktrace]}}}
