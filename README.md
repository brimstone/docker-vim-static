vim-static
==========

[![Build Status](https://travis-ci.org/brimstone/docker-vim-static.svg?branch=master)](https://travis-ci.org/brimstone/docker-vim-static)

Usage
=====

Create a container to be imported later.
```
docker create --name vim brimstone/vim-static
```

TL;DR:
```
docker run --rm -it \
	--volumes-from vim \
	--entrypoint=/opt/vim/bin/vim \
	-v $HOME:$HOME \
	-e "HOME=$HOME" \
	-u "$UID:$GID" \
	-v "$PWD:$PWD" \
	-w "$PWD" \
	language-specific-image
```

The important bits from this container are `--volumes-from vim` and
`--entrypoint=/opt/vim/bin/vim`. The other important bits are also mapping in
$HOME, setting $HOME. This is mainly for the `~/.vimrc` and `~/.vim`. This
could be shorted by building another container derived off this one, and
including your vim config there instead. I'll probably do this eventually.
