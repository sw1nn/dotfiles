{:user {:plugins      [[lein-midje "3.1.3"]
                       [lein-ancient "0.5.5"]
                       [jonase/eastwood "0.1.2"]
                       [cider/cider-nrepl "0.7.0-SNAPSHOT"]]
        :jvm-opts     ["-Xmx4G" "-Djava.net.preferIPv4Stack=true"]
        :injections   [(require 'clojure.pprint)
                       (require 'pjstadig.humane-test-output)]
        ;; :warn-on-reflection true
        :dependencies [[pjstadig/humane-test-output "0.6.0"]]
        }

  :auth {:repository-auth {#"https://clojars.org/repo"
                            {:username :env/clojars_username
                             :password :env/clojars_password}}
                           #"s3p://mc-maven-repo/"
                            {:username :env/mc_aws_username
                             :passphrase :env/mc_aws_passphrase}}}
