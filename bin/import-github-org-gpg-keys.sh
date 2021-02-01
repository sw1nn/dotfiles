#!/bin/bash

set -euo pipefail


if [[ -z "${GITHUB_REPO_ACCESS_TOKEN:-}" ]]; then
    echo "While logged into github.com in a browser, Go to "
    echo "https://github.com/settings/tokens and create a "
    echo "personal access token with 'Full Repo Access'"

    echo

    read -p "Personal Access Token: " token 
else
    token=${GITHUB_REPO_ACCESS_TOKEN:-}
fi

github() {
    curl -fsSL -H "Authorization: token $token" "https://api.github.com/$1"
}

organisations=$(github user/orgs | jq -r '.[] | .login') 

for org in ${organisations[@]}; do 
    read -p "Import users from organsation '${org}' [y/N]? " yn

    case $yn in
        Y|y|Yes|yes) import=true ;;
        *) import=false 
    esac

    if [[ "${import}" == "true" ]]; then
        members=$(github "orgs/${org}/members" | jq -r '.[] | .login')
        for user in ${members[@]}; do
            gpg --import <(curl -fsSL http://github.com/${user}.gpg)
        done
    fi
done

read -p "Import Github workflow key [Y|n]? " yn
import=true
case $yn in
    N|n|No|no) import=false ;;
    *) import=true
esac

if [[ "${import}" == "true" ]]; then
    gpg --receive-keys 4AEE18F83AFDEB23
fi
