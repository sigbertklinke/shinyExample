#!/bin/bash
/usr/bin/rsync -avh --exclude="alt/*" --exclude='archiv/*' --exclude='.git/*' --include='*.R' --include='*/'   --exclude='*' /home/sigbert/syncthing/datenanalyse-i_ii/Folien/ data/ --delete
