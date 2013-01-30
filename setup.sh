#!/bin/bash

dir=$(dirname $0)
cd $dir
$(ln -s $PWD/.emacs ~/.emacs)
$(ln -s $PWD/.emacs.d ~/.emacs.d)
