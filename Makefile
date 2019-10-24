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

TAG=${TARGET}:latest

default: build

build:
	@echo "docker: building '${TAG}'"
	@docker build -t ${TAG} .

run:
	@echo "docker: running '${TAG}'"
	@docker run -it ${TAG} bash

deploy:
	@echo "docker: logout, login and push '${TAG}'"
	@docker logout
	@docker login --username ${DOCKER_USERNAME} --password ${DOCKER_PASSWORD}
	@docker push ${TAG}
