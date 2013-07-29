export HIST_IGNORE_ALL_DUPS=true

export CLOJURESCRIPT_HOME=~/workspace/clojurescript

case "$(uname -s)" in
    "Linux") JAVA_HOME=/opt/java
              ;;
    "Darwin") JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_25.jdk/Contents/Home
              ;;
esac

export JAVA_OPTS="-Dfile.encoding=UTF-8 -Dslime.encoding=UTF-8 -Xmx4096m -XX:+HeapDumpOnOutOfMemoryError"

export SSH_ASKPASS=/usr/lib/openssh/ssh-askpass-fullscreen
export PATH=${HOME}/bin:/usr/local/bin:/usr/local/elasticmapreduce:${HOME}/.rvm/bin:${JAVA_HOME}/bin:/usr/bin:/usr/sbin:/bin:/sbin
