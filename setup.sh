#!/bin/bash

ln -s $(pwd)/.emacs    ~/.emacs
ln -s $(pwd)/.emacs.d  ~/.emacs.d

emacs --script install.el
