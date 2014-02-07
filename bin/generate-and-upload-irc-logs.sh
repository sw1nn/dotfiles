#!/bin/sh

exec >& ${HOME}/irc-upload.log 

DIR=$(mktemp -d)

trap "rm -rf ${DIR}" EXIT QUIT TERM

OUT="${DIR}/kixi-"

echo "${OUT}"


/home/neale/bin/split-irssi-logs "$OUT" "/home/neale/irclogs/Freenode/#kixi.log"

logs2html "${DIR}"

cat > ${DIR}/robots.txt << EOF
User-agent: *
Disallow: /
EOF

aws --profile mastodonc s3 sync ${DIR}/ s3://irc-logs
