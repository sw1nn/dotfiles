exec 1>&2

fpath=("${0:h}/src" ${fpath[@]})

autoload -Uz \
    happy_commit \
    lol_commits \
    block_master \
    block_sw1nnisms \
    block_aws_keys \
    cljfmt
