# One-liner to copy all test profiles into the user's local PTS test profiles directory
# WARNING: will overwrite existing test profiles if any matches exist

SCRIPT_PATH=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
rsync -av $SCRIPT_PATH/ $HOME/.phoronix-test-suite/test-profiles/local --exclude="copy.sh"
echo $SCRIPT_PATH/copy.sh
