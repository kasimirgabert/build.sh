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
tCMMhoZUfKATo/OSTMRPrP8DSX5GT3YiAAA=
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
