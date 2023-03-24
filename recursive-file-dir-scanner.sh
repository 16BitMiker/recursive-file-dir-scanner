#!/bin/bash
# one liner version

tree -a --dirsfirst --nolinks -hCH . | perl -ple 's`(&nbsp;){1,}`$1`g' | perl -ple 's`</?(?:hr|p)[^>]*?>``g' | perl -ple 's`^\s+(?:tree\sv2|(?:HTML|JSON)\soutput\shacked|Charsets\s/).*``;' | perl -sple 's`(</body>)`q|- |.qx|$size|.$1`e' -- -size="du -sh ." > tree.html
