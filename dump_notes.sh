#!/bin/bash

cat ~/Library/texmf/bibtex/bib/cms_notes.bib | grep Article -i | sed \
"s|.*{||"  | sed "s|,$||" 

