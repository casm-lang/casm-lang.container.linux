#
#   Copyright (C) 2017-2022 CASM Organization <https://casm-lang.org>
#   All rights reserved.
#
#   Developed by: Philipp Paulweber et al.
#                 <https://github.com/casm-lang/casm-lang.container.linux/graphs/contributors>
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

FROM archlinux:base-devel

ARG USER=aur
RUN useradd \
    -r \
    -m \
    -d /$USER \
    -s /usr/bin/nologin \
    -u "999" \
    $USER \
 && echo "$USER ALL=(ALL:ALL) NOPASSWD:ALL" > /etc/sudoers.d/$USER \
 && pacman --noconfirm -Syu git sudo \
 && git clone https://aur.archlinux.org/yay-bin /$USER/yay \
 && chown -R $USER:$USER /$USER \
 && cd /$USER/yay \
 && sudo -u $USER makepkg --noconfirm -si \
 && cd /$USER \
 && rm -rf yay \
 && sudo -u $USER yay --noconfirm -S \
    bash \
    git \
    make \
    cmake \
    ninja \
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
    z3 \
    gtest \
    hayai-git \
 && sudo pacman -Scc \
 && rm -rf /var/cache/pacman/pkg/* \
 && sudo -u $USER yay -Ps

CMD ["/bin/bash"]
