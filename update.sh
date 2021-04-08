#!/bin/sh

export AWS_PAGER=""
set -ex

html-minifier --remove-tag-whitespace --minify-css true --collapse-whitespace --collapse-boolean-attributes index.html > index.min.html
aws s3 cp index.min.html s3://makeinstallnotwar/index.html --content-type 'text/html;charset=utf-8' --content-language en
aws cloudfront create-invalidation --distribution-id E20MWOSXW5W8W4 --paths / /index.html
