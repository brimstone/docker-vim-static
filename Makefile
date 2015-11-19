vim:
	docker build -t vim-builder .
	docker run --rm vim-builder > vim.tar
	docker build -t vim -f Dockerfile.static .
