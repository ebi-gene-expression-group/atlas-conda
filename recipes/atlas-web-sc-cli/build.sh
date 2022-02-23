mkdir -p $PREFIX/bin
CLI_DIR=$PREFIX/share/atlas-cli
mkdir -p $CLI_DIR

# compile JAR
./gradlew --no-daemon :cli:bootJar

cp cli/build/libs/atlas-cli-sc.jar $CLI_DIR
rm -rf cli
chmod a+x $RECIPE_DIR/atlas-web-sc-scli.sh
cp $RECIPE_DIR/atlas-web-sc-scli.sh $PREFIX/bin/
