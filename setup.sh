#!/bin/bash

dir=$(dirname $0)
abspath=$(readlink -e ${dir})
$(ln -s ${abspath}/.emacs ~/.emacs)
$(ln -s ${abspath}/.emacs.d ~/.emacs.d)
