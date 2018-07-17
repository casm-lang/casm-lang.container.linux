#
#   Copyright (C) 2017-2018 Philipp Paulweber
#   All rights reserved.
#
#   Developed by: Philipp Paulweber
#                 <https://github.com/ppaulweber/docker-cpp>
#
#   This file is part of docker-cpp.
#
#   docker-cpp is free software: you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation, either version 3 of the License, or
#   (at your option) any later version.
#
#   docker-cpp is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with docker-cpp. If not, see <http://www.gnu.org/licenses/>.
#

FROM greyltc/archlinux

RUN pacman --noconfirm -Syu  && \
    pacman --noconfirm -S \
    bash \
    git \
    make \
    cmake \
    python \
    openssh \
    curl \
    wget \
    tar \
    bison \
    flex \
    gcc \
    clang

RUN mkdir -p ~/.ssh && \
    ssh-keyscan github.com >> ~/.ssh/known_hosts

# # CMAKE
# RUN CMAKE_REV=http://cmake.org/files/v3.7/cmake-3.7.2-Linux-x86_64.tar.gz && \
#     wget  -qO /tmp/cmake.tar.gz --no-check-certificate ${CMAKE_REV} && \
#     tar  -xaf /tmp/cmake.tar.gz --strip-components=1 -C /usr && \
#     rm     -f /tmp/cmake.tar.gz && \
#     cmake --version

# # CLANG
# RUN CLANG_REV=http://releases.llvm.org/5.0.0/clang+llvm-5.0.0-linux-x86_64-ubuntu16.04.tar.xz && \
#     wget  -qO /tmp/clang.tar.xz --no-check-certificate ${CLANG_REV} && \
#     tar  -xJf /tmp/clang.tar.xz --strip-components=1 -C /usr && \
#     rm     -f /tmp/clang.tar.xz && \
#     clang --version

# # GCC
# RUN GCC_REV=http://ftp.gnu.org/gnu/gcc/gcc-7.2.0/gcc-7.2.0.tar.xz && \
#     wget  -qO /tmp/gcc.tar.xz ${GCC_REV} && \
#     mkdir     /tmp/gcc && \
#     tar  -xJf /tmp/gcc.tar.xz --strip-components=1 -C /tmp/gcc && \
#     cd        /tmp/gcc && \
#     ./contrib/download_prerequisites && \
#     cd        .. && \
#     mkdir     gcc-build && \
#     cd        gcc-build && \
#     ../gcc/configure --enable-languages=c,c++ && \
#     make && \
#     make install && \
#     cd        /tmp && \
#     rm    -rf /tmp/gcc* && \
#     gcc --version && \
#     g++ --version

RUN bash   --version && \
    git    --version && \
    make   --version && \
    cmake  --version && \
    python --version && \
    ssh    -V        && \
    curl   --version && \
    wget   --version && \
    tar    --version && \
    bison  --version && \
    flex   --version && \
    gcc    --version && \
    clang  --version

CMD ["/bin/bash"]
