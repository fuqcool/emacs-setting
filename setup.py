#!/usr/bin/env python
# -*- coding: utf-8 -*-

import shutil

if __name__ == "__main__":
    # copy .emacs to ~/
    shutil.copyfile(".emacs", "~/test/.emacs")
    # copy .emacs.d to ~/.emacs.d
    shutil.copytree(".emacs.d", "~/test/.emacs.d")
