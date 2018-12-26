#!/bin/bash

set -ev
set -o pipefail

DESTINATION="'platform=macOS'"

if [ "${TRAVIS_XCODE_PROJECT-UNDEF}" != "UNDEF" ]; then
    xcodebuild -project ${TRAVIS_XCODE_PROJECT} -scheme ${TRAVIS_XCODE_SCHEME} -destination ${DESTINATION} -sdk ${TRAVIS_XCODE_SDK} test
else
    xcodebuild -workspace ${TRAVIS_XCODE_WORKSPACE} -scheme ${TRAVIS_XCODE_SCHEME} -destination ${DESTINATION} -sdk ${TRAVIS_XCODE_SDK} test
fi
