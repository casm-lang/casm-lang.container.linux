#
#   Copyright (C) 2017-2021 CASM Organization <https://casm-lang.org>
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

FROM oblique/archlinux-yay

RUN sudo pacman --noconfirm -Syy && \
    sudo -u aur yay --noconfirm -S \
    bash \
    git \
    make \
    cmake \
    openssh \
    curl \
    wget \
    tar \
    python \
    bison \
    flex \
    gcc \
    clang \
    openmp \
    emscripten \
    z3 \
    gtest \
    hayai-git

CMD ["/bin/bash"]
