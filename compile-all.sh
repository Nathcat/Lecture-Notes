#!/bin/bash

sudo apt install latex2html -y

mkdir html

#
#   Year 2
#

mkdir "html/Year 2"

#
#   G5115 - Computer Networks
#

cd "Year 2/Computer Networks"
latex2html "Computer Networks.tex" -dir "../../html/Year 2/G5115-Computer-Networks" -mkdir
cd ../..

#
#   G6059 - Operating Systems
#

cd "Year 2/Operating Systems"
latex2html "Operating Systems.tex" -dir "../../html/Year 2/G6059-Operating-Systems" -mkdir
cd ../..

#
#   Year 3
#

mkdir "html/Year 3"

#
#   G5026 - Human Computer Interaction
#

cd "Year 3/Human Computer Interaction"
latex2html "Human Computer Interaction.tex" -dir "../../html/Year 3/G5026-Human-Computer-Interaction" -mkdir
cd ../..