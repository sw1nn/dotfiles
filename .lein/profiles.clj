{:user {:plugins      [[lein-ancient "0.6.4"]
                       [jonase/eastwood "0.1.4"]
                       [cider/cider-nrepl "0.8.2"]
                       [com.palletops/uberimage "0.4.1"]]
        :jvm-opts     ["-Xmx4G" "-Djava.net.preferIPv4Stack=true"]
        :injections   [(require 'clojure.pprint)
                       ;; (require 'pjstadig.humane-test-output)
                       ;; (pjstadig.humane-test-output/activate!)
                       ]
        ;; :warn-on-reflection true
        :dependencies [;; [pjstadig/humane-test-output "0.6.0"]
                       ]
        }

  :auth {:repository-auth {#"https://clojars.org/repo"
                            {:username :env/clojars_username
                             :password :env/clojars_password}}
                           #"s3p://mc-maven-repo/"
                            {:username :env/mc_aws_username
                             :passphrase :env/mc_aws_passphrase}}}
