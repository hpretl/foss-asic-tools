#!/bin/bash

set -e

git clone --filter=blob:none "${XYCE_XDM_REPO_URL}" "${XYCE_XDM_NAME}"
cd "${XYCE_XDM_NAME}"
git checkout "${XYCE_XDM_REPO_COMMIT}"

#FIXME path build errors
sed -i 's/isnan/std::isnan/g' src/c_boost/expr/ast_common.hpp
sed -i 's/isnan/std::isnan/g' src/c_boost/expr/hspice_expr_parser_interface.cpp
sed -i 's/isnan/std::isnan/g' src/c_boost/expr/spectre_expr_parser_interface.cpp

mkdir build && cd build
PREFIX=${TOOLS}/${XYCE_XDM_NAME}
cmake -DCMAKE_INSTALL_PREFIX="$PREFIX" ..
make -j"$(nproc)"
make install
