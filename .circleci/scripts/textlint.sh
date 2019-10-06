#!/bin/sh
textlint --plugin review --preset preset-ja-technical-writing article/*.re > \
textlint.log || EXIT_CODE=$?

cat textlint.log | bin/reviewdog -reporter=github-pr-review \
	-diff='git --no-pager diff origin/master' \
	-f=checkstyle \
	-name=textlint

exit ${EXIT_CODE}
