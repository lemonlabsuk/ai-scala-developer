set -e

mkdir -p tmp
cd tmp

while read REPO; do
  git clone $REPO
  
  SHORT_NAME=$(echo $REPO | sed 's#https://github.com/##g' | tr '/' '_')
  SCALA_FILES=$(find . -path '*src/main/*' -name '*.scala')

  if [ -z "$SCALA_FILES" ]; then
    echo "No scala files"
  else
    echo "Copying scala files"
    echo "$SCALA_FILES" | while IFS= read -r FILE ; do mv "$FILE" "../scala-codes/${SHORT_NAME}_$(basename $FILE)"; done
  fi

  rm -rf "./$(basename $REPO)"
done < ../scala-codes-repos.txt

# Remove symlinks; they won't point to anything anymore
find ../scala-codes/ -type l -ls -exec rm {} \;

cd -
