#!/bin/sh

if [ -z "$PROJECT_DIR" ]; then
    PROJECT_DIR="/Users/EdwinGoldberg/Documents/XCode Projects/MH4U Dex"
fi
if [ -z "$PROJECT_NAME" ]; then
    PROJECT_NAME="MH4U Dex"
fi

PATH=${PATH}:/usr/local/bin
cd "${PROJECT_DIR}/${PROJECT_NAME}/"

MODEL_NAME="MH4U_Dex"
OUTPUT_DIR="${PROJECT_DIR}/${PROJECT_NAME}/Model"
PATH_TO_MODEL="${OUTPUT_DIR}/$MODEL_NAME.xcdatamodeld"

mogenerator -m "$PATH_TO_MODEL" -M "$OUTPUT_DIR/Private" -H "$OUTPUT_DIR/Public" --template-var arc=true