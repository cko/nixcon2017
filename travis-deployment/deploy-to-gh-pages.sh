#!/bin/bash
echo "start deployment ..."
set -e

TMP_CHECKOUT_DIR=tmp/origin-gh-pages
(
  set -e
  git clone --branch=gh-pages "https://${GH_TOKEN}@${GH_REF}" $TMP_CHECKOUT_DIR

  echo "deploy: checked out 'gh-pages' branch"
  rm -rf $TMP_CHECKOUT_DIR/*
  cp -r result/* $TMP_CHECKOUT_DIR
  cp CNAME $TMP_CHECKOUT_DIR
  cd $TMP_CHECKOUT_DIR

  echo "deploy: adding files"
  git config --global user.name "Travis CI"
  git config --global user.email "mail@example.com"
  # `--all` ensures that only the files from the last build end in the repo
  git add --all .

  echo "deploy: committing"
  git commit -m "Travis deployed 'master' - `date`" || true

  echo "deploy: push to gh-pages"
  git push "https://${GH_TOKEN}@${GH_REF}" gh-pages:gh-pages
)
