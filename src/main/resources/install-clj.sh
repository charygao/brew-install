#!/usr/bin/env bash

# Find java executable
JAVA_CMD=`type -p java`
if [[ ! -n "$JAVA_CMD" ]]; then
  if [[ -n "$JAVA_HOME" ]] && [[ -x "$JAVA_HOME/bin/java" ]]; then
    JAVA_CMD="$JAVA_HOME/bin/java"
  else
    >&2 echo "Couldn't find 'java'. Please set JAVA_HOME."
  fi
fi

install_dir=PREFIX

if [[ ! -d "$HOME/.clojure" ]]; then
  mkdir "$HOME/.clojure"
fi

if [[ ! -f "$HOME/.clojure/clj.props"]]; then
  cp "$install_dir/clj.props" "$HOME/.clojure/clj.props"
fi

# Run initial dependency installer
"$JAVA_CMD" -classpath "$install_dir/clojure-install-${project.version}.jar" clojure.tools.Install
