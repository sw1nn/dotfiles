{:user {:plugins      [[lein-ritz "0.7.0"]
                       [lein-midje "3.1.3"]
                       [lein-marginalia "0.7.1"]
                       [lein-try "0.4.1"]
                       [lein-ancient "0.5.5"]
                       [jonase/eastwood "0.1.2"]
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
                       [clj-stacktrace "0.2.7"]
                       [clojure-complete "0.2.3"]
                       [pjstadig/humane-test-output "0.6.0"]
                       [spyscope "0.1.4"]
                       [slamhound "1.5.5"]
                       [alembic "0.2.1"]
                       [cider/cider-nrepl "0.6.1-SNAPSHOT"]
                       ]

        :repl-options {:nrepl-middleware
                       [cider.nrepl.middleware.classpath/wrap-classpath
                        cider.nrepl.middleware.complete/wrap-complete
                        cider.nrepl.middleware.info/wrap-info
                        cider.nrepl.middleware.inspect/wrap-inspect
                        cider.nrepl.middleware.stacktrace/wrap-stacktrace]}}}
