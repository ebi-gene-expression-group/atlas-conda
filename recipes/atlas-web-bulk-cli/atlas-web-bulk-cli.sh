#!/usr/bin/env bash

jar_dir=$CONDA_PREFIX/share/atlas-cli

java $JAVA_OPTS -jar $jar_dir/atlas-cli-bulk.jar $@
