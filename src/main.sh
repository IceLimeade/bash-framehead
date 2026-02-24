#!/usr/bin/env bash

_BASH_FRAMEHEAD_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "${_BASH_FRAMEHEAD_DIR}/runtime.sh"
source "${_BASH_FRAMEHEAD_DIR}/array.sh"
source "${_BASH_FRAMEHEAD_DIR}/colour.sh"
source "${_BASH_FRAMEHEAD_DIR}/device.sh"
source "${_BASH_FRAMEHEAD_DIR}/fs.sh"
source "${_BASH_FRAMEHEAD_DIR}/git.sh"
source "${_BASH_FRAMEHEAD_DIR}/hardware.sh"
source "${_BASH_FRAMEHEAD_DIR}/net.sh"
source "${_BASH_FRAMEHEAD_DIR}/pm.sh"
source "${_BASH_FRAMEHEAD_DIR}/process.sh"
source "${_BASH_FRAMEHEAD_DIR}/random.sh"
source "${_BASH_FRAMEHEAD_DIR}/string.sh"
source "${_BASH_FRAMEHEAD_DIR}/terminal.sh"

unset _BASH_FRAMEHEAD_DIR
