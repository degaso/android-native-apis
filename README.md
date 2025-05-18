# AndroidJS SDK Source
This is the source of the AndroidJS node runtime.

This contains some fixes regarding opening links in external browsers and opening deep links.

## Building
- To build this, run `./gradlew build`
- To generate the SDK used by AndroidJS (=decompiling the built apk into `../androidjs-sdk`), run  `./build_sdk.sh` (will use app version code for SDK version code)
- To temporarly use the built SDK from `../androidjs-sdk` in local androidjs, run `./deploy_sdk.sh`