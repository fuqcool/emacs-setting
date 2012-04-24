@echo off
if defined HOME (set emacs_home=%HOME%) else (set emacs_home=%APPDATA%)

mklink %emacs_home%\.emacs %~dp0.emacs
mklink /D %emacs_home%\.emacs.d %~dp0.emacs.d
pause
