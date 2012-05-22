#!/bin/sh
find -L . -type f \( -iname "*.cpp" -o -iname "*.c" -o -name "*.h" -o -name "*.inl" -o -name "*.ci" -o -name "*.ext" -o -name "*.def" -o -name "*.hi" -o -name "*.ti" -o -name "*.csm" -o -name "*.std" -o -name "*.sx" -o -name "*.sxdef" \) > cscope.files
cscope -bRqv
ctags -RV --c++-kinds=+p --fields=+iaS --extra=+q
