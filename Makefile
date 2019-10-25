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

ifdef GITHUB_WORKFLOW
  # https://help.github.com/en/articles/virtual-environments-for-github-actions#environment-variables
  DOCKER_LABEL = ${GITHUB_REF}
endif

DOCKER_IMAGE = ${TARGET}:${DOCKER_TAG}

default: build

build:
	@echo "-- docker: build '${DOCKER_IMAGE}'"
	docker build -t ${DOCKER_IMAGE} .

run:
	@echo "-- docker: run '${DOCKER_IMAGE}'"
	docker run -it ${DOCKER_IMAGE} bash

deploy:
	@echo "-- docker: push '${DOCKER_IMAGE}'"
	docker push ${DOCKER_IMAGE}
