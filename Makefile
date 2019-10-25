#
#   Copyright (C) 2017-2019 CASM Organization <https://casm-lang.org>
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

TARGET = casmlang/container.linux

DOCKER_LABEL = $(shell git rev-parse --abbrev-ref HEAD | sed "s/\//-/g")
ifeq (${DOCKER_LABEL},master)
  DOCKER_LABEL = latest
endif

DOCKER_TAG = ${TARGET}:${DOCKER_LABEL}

default: build

build:
	@echo "-- docker: build '${DOCKER_TAG}'"
	docker build -t ${DOCKER_TAG} .

run:
	@echo "-- docker: run '${DOCKER_TAG}'"
	docker run -it ${DOCKER_TAG} bash

deploy:
	@echo "-- docker: push '${DOCKER_TAG}'"
	docker push ${DOCKER_TAG}
