vim:
	docker build -t vim-builder .
	docker run --rm vim-builder > vim.tar
	docker build -t vim-static -f Dockerfile.static .

travis: vim
	@[ -f ${HOME}/.dockercfg ] || docker login -e="${DOCKER_EMAIL}" -u="${DOCKER_USERNAME}" -p="${DOCKER_PASSWORD}"
	docker push brimstone/vim-static
