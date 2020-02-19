#!/bin/sh

for i in `cat extensions.txt`; do
    echo $i
    code --install-extension $i
done

