#!/bin/bash
MINPARAMS=1
PDSERVER="https://pixeldrain.com"

for FILE in "$@"
do
        FILENAME="${FILE##*/}"

        echo "Uploading $FILENAME ... "
        RESPONSE=$(curl -# -F "name=$FILENAME" -F "file=@$FILE" $PDSERVER/api/file)
        FILEID=$(echo $RESPONSE | grep -Po '(?<="id":")[^"]*')

        echo "Your file URL: $PDSERVER/u/$FILEID"
        echo ""
done

echo "" # Move cursor down when script finishes
