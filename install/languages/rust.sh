#!/usr/bin/env bash
# -*- coding: utf-8 -*-
# vim: set ft=sh et ts=4 sw=4 sts=4:
# ----------------------------------------------------------------------------#
#                                        _         _
#                         _ __ _   _ ___| |_   ___| |__
#                        | '__| | | / __| __| / __| '_ \
#                        | |  | |_| \__ \ |_ _\__ \ | | |
#                        |_|   \__,_|___/\__(_)___/_| |_|
#
#
# Author: Serhat Teker <serhat.teker@gmail.com>
# Source: https://github.com/SerhatTeker/dotfiles
#
# Install rust toolchain and cargo
# ----------------------------------------------------------------------------#

# Bash safeties: exit on error, no unset variables, pipelines can't hide errors
set -o errexit
set -o nounset
set -o pipefail

# Locate the root directory
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

# shellcheck disable=1091
source "${ROOT}/common.sh"

APP="rush"

# Install rust for macOS, Linux, or another Unix-like OS
_install() {
    # Disable confirmation and go with Option 1
    curl --proto '=https' --tlsv1.3 https://sh.rustup.rs -sSf | sh -s -- -y
}

main() {
    local _RUST="${HOME}/rust"
    export RUSTUP_HOME="${_RUST}/.rustup"
    export CARGO_HOME="${_RUST}/.cargo"

    # Install if not present
    command_exists cargo -V || _install

    # check_rights
    "${CARGO_HOME}/.cargo/bin/rustup" override set stable
    "${CARGO_HOME}/.cargo/bin/rustup" update stable

    # Ensure install
    command_exists "${CARGO_HOME}/.cargo/bin/cargo" -V &&
        success "${APP} installed at your system"
}

main "$@"
