{:user {
        :plugins      [[org.clojure/tools.nrepl "0.2.12"]
                       [lein-ancient "0.6.8" :exclusions [org.clojure/clojure] ]
                       [jonase/eastwood "0.2.3" :exclusions [org.clojure/clojure]]
                       [cider/cider-nrepl "0.13.0"]
                       [refactor-nrepl "2.2.0"]
                       ;; [com.palletops/uberimage "0.4.1" :exclusions [org.clojure/clojure]]
                       [lein-cljfmt "0.3.0" :exclusions [org.clojure/clojure]]]
        :jvm-opts     ["-Xmx4G"]
        :injections   []
        ;; :warn-on-reflection true
        :dependencies [[org.clojure/clojure "1.8.0"]
                       [acyclic/squiggly-clojure "0.1.5"]
                       ^:replace [org.clojure/tools.nrepl "0.2.12"]
                       [criterium "0.4.4"]]
        :signing {:gpg-key "CCEAE48D"}}}
