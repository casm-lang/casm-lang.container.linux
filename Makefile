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

DOCKER_TAG=${TARGET}:latest

DOCKER_HOME   = ${HOME}/.docker
DOCKER_CONFIG = ${DOCKER_HOME}/config.json

default: build

build:
	@echo "docker: building '${DOCKER_TAG}'"
	docker build -t ${DOCKER_TAG} .

run:
	@echo "docker: running '${DOCKER_TAG}'"
	docker run -it ${DOCKER_TAG} bash

deploy:
	@echo "docker: logout, login and push '${DOCKER_TAG}'"
	docker logout

	@mkdir -p ${DOCKER_HOME}

	@echo '{'                                      > ${DOCKER_CONFIG}
	@echo '    "Username": "${DOCKER_USERNAME}",' >> ${DOCKER_CONFIG}
	@echo '    "Secret":   "${DOCKER_PASSWORD}"'  >> ${DOCKER_CONFIG}
	@echo '}'                                     >> ${DOCKER_CONFIG}

	docker login
	docker push ${DOCKER_TAG}

	@rm -f ${DOCKER_CONFIG}
