#!/usr/bin/env bash

scriptDir=$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
jar_dir=$CONDA_PREFIX/share/atlas-cli

java $JAVA_OPTS -jar $jar_dir/atlas-cli-bulk.jar $@
