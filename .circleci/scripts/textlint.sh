#!/bin/sh
textlint --format checkstyle --config .textlintrc article/*.re > \
textlint.log || EXIT_CODE=$?

cat textlint.log | bin/reviewdog -reporter=github-pr-review \
	-diff='git --no-pager diff origin/master' \
	-f=checkstyle \
	-name=textlint

exit ${EXIT_CODE}
