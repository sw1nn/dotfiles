{:user {:plugins []
        :jvm-opts ["-Xmx4G"]
        :injections [(require 'clojure.repl)
                     (require 'clojure.pprint)]
        :warn-on-reflection true}
 }
