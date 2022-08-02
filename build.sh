#!/bin/bash

# Copyright (c) 2022, Kasimir Gabert
# All rights reserved.

# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are
# met:
#
# * Redistributions of source code must retain the above copyright notice,
#   this list of conditions and the following disclaimer.
# * Redistributions in binary form must reproduce the above copyright
#   notice, this list of conditions and the following disclaimer in the
#   documentation and/or other materials provided with the distribution.
# * Neither the name of the copyright holder nor the names of its
#   contributors may be used to endorse or promote products derived from
#   this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS
# IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
# THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
# PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDERS BE LIABLE
# FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
# DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
# SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
# CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
# LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
# OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
# SUCH DAMAGE.

tag="build.sh-v1.1"

pushd $(dirname $0) &>/dev/null

if [[ "$#" -gt 0 && "$1" == "--help" ]]; then
    echo "Usage: build.sh [--help] [--setup] [--full]"
    echo ""
    echo "Parameters:"
    echo "  --help  : this message"
    echo "  --setup : create a default environment with Makefiles"
    echo "  --full  : rebuild the container even if it exists"
    exit
fi

if [[ "$#" -gt 0 && "$1" == "--setup" ]]; then
    . /dev/stdin <<<"$(cat <<EOF | base64 -d | gunzip
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
EOF
)"
fi

if [ ! -e Makefile ]; then
    echo "No Makefile found. Pass --setup to build initial environment"
    exit 1
fi

D="docker"
if command -v podman; then
    D="podman"
fi

if [[ "$#" -gt 0 && "$1" == "--full" ]] || ! $D image exists $tag; then
    . /dev/stdin <<<"$(cat <<EOF | base64 -d | gunzip
H4sIAI9G6WIAA6VVW2/bNhR+1684U7zG7kaxdtu0SOqibZwMxpK4MNoVwzwYtERJrCWSJY9cBcP+eylK
jpW26MP2YpHfuX7nQgMA2FykeBa4E5TbRBjgcudvMUN48eL4YnF5DC8dSIW0yIoiMsH+pFm8ZRm3w9Dw
UiG34SgoxMYwczvskFHQHU5PO6v1jhsrlByGvEbDUiUx/BU6cBo+isbPwh9ZLRHTicZx32gcPY6e94Lf
eR4FQfNZi1Irg0PNMJ+G1CiFtMGtc6KNKjVOL53qt7wKhrye8Fo7599jbXOm+cQJXZm+X7WZirfcpKLg
weVycQ3VppJYnU4m0aMnQXAE89YrJFxzmXAZC26D5fsbcEFdyjC7eDN/fbN2tjfvLm5mU6mkkMgNi1Hs
ODx4ACsfmGkkGUeodOJybvADkhmWcCC3fbRj06CtA0e0cB5JWjm0hUq25d3REMNjVZZNjom7xYZJkmW6
UDjpVJqCpspke5O4MntH9S7dgGtOtinHzZdZVclkAjWrMO90hNza2FXzXlEM+xwJ5evh3ZErIApogwsV
Ma0hR9T2lNJMYF5tIpcj/ej46rxTIgm3W1SaGl5wZrmlifosC8USuhufRE+j8V6xfn6yPnlCWjB6rfW8
dG1uahbnpUrgl7ofuO1RnCsIj36iGyGpY5WvZEOVmEoCYXt1aj9VTpZa4gevBWEVrgavViEQIhWxTCYb
VYfwEmhljffX6d2Lf18WfFgsf5/Nl/tAPqd+cQhxv6KhQfxKxHgw6dfZC2EJ+9EGl47vJ9hKN2PoPbfv
Q297DtPn+g61a2GbodsKw1sVqtxY463mtBCyqolrPjcoJKdXQl7tL+tlpDD9z8bz/2X9prE+g0R1XDwf
OR38Ux8dPaT/Hkh6gesyd7JU/tyYfSW9689hF0jBZDZNUyAxHC9cRsPBeHQGv3Hpdhj5cDBxt/NCWT4c
nR3DoO4XmA58vAjbBKVbjvPF2z/h7ikGiqXuvcxNm5Y2NkLj16Lgj8XV++sLoKXsTUFzCc6vZ/BX2Gx7
+Ld/yTyhwQz86MCmEkUCBGGALPP/D+2TUAIxO3//AtMbJstJBgAA
EOF
)"
fi

localmnt="$PWD"
if [ "$(uname)" == "Darwin" ]; then
    localmnt="/mnt$localmnt"
fi
localmnt="$localmnt:/mnt"
if [ "$(uname)" != "Darwin" ]; then
    localmnt="$localmnt:Z"
fi
$D run --rm -it -v "$localmnt" $tag
popd &>/dev/null
