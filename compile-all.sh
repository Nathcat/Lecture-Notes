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
latex2html "Computer-Networks.tex" -dir "../../html/Year 2/G5115-Computer-Networks" -mkdir
cd ../..

#
#   G6059 - Operating Systems
#

cd "Year 2/Operating Systems"
latex2html "Operating-Systems.tex" -dir "../../html/Year 2/G6059-Operating-Systems" -mkdir
cd ../..

#
#   Year 3
#

mkdir "html/Year 3"

#
#   G5026 - Human Computer Interaction
#

cd "Year 3/Human Computer Interaction"
latex2html "Human-Computer-Interaction.tex" -dir "../../html/Year 3/G5026-Human-Computer-Interaction" -mkdir
cd ../..

#
#   G6077 - Intro to Computer Security
#

cd "Year 3/Intro to Computer Security"
latex2html "Intro-to-Computer-Security.tex" -dir "../../html/Year 3/G6077-Intro-to-Computer-Security" -mkdir
cd ../..

#
#   G6021 - Comparative Programming
#

cd "Year 3/Comparative Programming"
latex2html "Comparative-Programming.tex" -dir "../../html/Year 3/G6021-Comparative-Programing" -mkdir
cd ../..
