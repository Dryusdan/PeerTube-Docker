#!/bin/sh

COMMIT_ID=$(git log -n 1 --pretty=format:%H -- peertube/)
LAST_COMMIT_ID=$(git log -n 1 --pretty=format:%H --)

if [ "$COMMIT_ID" == "$LAST_COMMIT_ID" ]; then
   echo "build image"
   docker build -t registry.dryusdan.fr/dryusdan/peertube peertube/
   docker push registry.dryusdan.fr/dryusdan/peertube
   docker rmi registry.dryusdan.fr/dryusdan/peertube
else
   echo "image is recent. No build"
fi
