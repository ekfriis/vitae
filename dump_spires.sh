#!/bin/bash

cat ~/Library/texmf/bibtex/bib/spires_papers.bib | grep Article | sed \
"s|^@[Aa]rticle{||"  | sed "s|,$||" 

