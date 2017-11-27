#
#   Copyright (c) 2017 Philipp Paulweber
#   All rights reserved.
#
#   Developed by: Philipp Paulweber
#                 https://github.com/ppaulweber/docker-cpp
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

FROM alpine

RUN apk update
RUN apk upgrade
RUN apk add \
    bash
    curl
    git
    make
    cmake
    gcc
    g++
    flex
    bison
    linux-headers

