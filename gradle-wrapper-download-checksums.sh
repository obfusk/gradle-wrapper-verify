#!/bin/bash
set -e
all_versions_url=https://services.gradle.org/versions/all
url_prefix=https://services.gradle.org/distributions
jq_cmd='.[] | select(.wrapperChecksumUrl != null) | .version + " " + .wrapperChecksumUrl' 
while read -r version url; do
  expected_url="$url_prefix/gradle-$version-wrapper.jar.sha256"
  if [ "$url" != "$expected_url" ]; then
    echo "wrong url for $version" >&2
    echo "expected: $expected_url" >&2
    echo "got     : $url" >&2
  else
    sha256sum="$( curl -sL -- "$url" | cut -c-64 | tr -cd '0-9a-f' )"
    echo "$version=$sha256sum"
  fi
done < <( curl -sL -- "$all_versions_url" | jq -r "$jq_cmd" )
