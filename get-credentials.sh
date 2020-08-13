#!/bin/sh
 
echo "Retrieving credential files..."

gsutil cp gs://ci-credentials/.firebaserc ./firebaserc
gsutil cp gs://ci-credentials/index_debug.html ./web/index.html
