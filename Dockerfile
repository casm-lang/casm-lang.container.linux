#
#   Copyright (C) 2017-2018 CASM Organization <https://casm-lang.org>
#   All rights reserved.
#
#   Developed by: Philipp Paulweber
#                 <https://github.com/casm-lang/casm-lang.container.linux>
#
#   This file is part of casm-lang.container.linux.
#
#   casm-lang.container.linux is free software: you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation, either version 3 of the License, or
#   (at your option) any later version.
#
#   casm-lang.container.linux is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with casm-lang.container.linux. If not, see <http://www.gnu.org/licenses/>.
#

FROM pritunl/archlinux

RUN pacman --noconfirm -Sy && \
    pacman --noconfirm -S  \
    bash \
    git \
    make \
    cmake \
    openssh \
    curl \
    wget \
    tar

RUN mkdir -p ~/.ssh && \
    ssh-keyscan github.com >> ~/.ssh/known_hosts

RUN pacman --noconfirm -S \
    python

RUN pacman --noconfirm -S \
    bison \
    flex

RUN pacman --noconfirm -S \
    gcc

RUN pacman --noconfirm -S \
    clang \
    openmp

RUN pacman --noconfirm -S \
    emscripten

CMD ["/bin/bash"]
