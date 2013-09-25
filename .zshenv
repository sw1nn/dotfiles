export HIST_IGNORE_ALL_DUPS=true

export CLOJURESCRIPT_HOME=~/workspace/clojurescript

case "$(uname -s)" in
    "Linux") JAVA_HOME=/opt/java
              ;;
    "Darwin") JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_40.jdk/Contents/Home
              ;;
esac

export JAVA_OPTS="-Dfile.encoding=UTF-8 -Dslime.encoding=UTF-8 -Xmx4096m -XX:+HeapDumpOnOutOfMemoryError"

export CUPS_SERVER=localhost
export SSH_ASKPASS=/usr/lib/openssh/ssh-askpass-fullscreen
