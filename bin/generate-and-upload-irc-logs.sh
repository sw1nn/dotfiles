#!/bin/sh

exec >& ${HOME}/irc-upload.log 

DIR=$(mktemp -d)
trap "rm -rf ${DIR}" EXIT QUIT TERM

DESTDIR=/var/cache/irclog-upload

OUT="${DIR}/kixi"

for f in /home/neale/irclogs/Freenode/\#kixi*.log 
do
    /home/neale/bin/split-irssi-logs "$OUT" "$f"
done

logs2html --style xhtml "${DIR}"

if [ ! -f ${DESTDIR}/robots.txt ]; then
    cat > ${DESTDIR}/robots.txt << EOF
User-agent: *
Disallow: /
EOF

fi 

# We generate into a tmp directory and then only copy over stuff that's
# changed. All this purely to preserve timestamps.
rsync -cvrl ${DIR}/ ${DESTDIR}

aws --profile mastodonc s3 sync --delete ${DESTDIR}/ s3://irc-logs
