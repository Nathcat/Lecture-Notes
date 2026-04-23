#!/bin/bash

#
#   Year 2
#

mkdir "html/Year 2"

#
#   G5115 - Computer Networks
#

cd "Year 2/Computer Networks"
pdflatex Computer-Networks.tex
cd ../..

#
#   G6059 - Operating Systems
#

cd "Year 2/Operating Systems"
pdflatex Operating-Systems.tex
cd ../..

#
#   Year 3
#

#
#   G5026 - Human Computer Interaction
#

cd "Year 3/Human Computer Interaction"
pdflatex Human-Computer-Interaction.tex
cd ../..

#
#   G6077 - Intro to Computer Security
#

cd "Year 3/Intro to Computer Security"
pdflatex Intro-to-Computer-Security.tex
cd ../..

#
#   G6021 - Comparative Programming
#

cd "Year 3/Comparative Programming"
pdflatex Comparative-Programming
cd ../..

#
#   G5015 - Neural Networks
#

cd "Year 3/Neural Networks"
pdflatex Neural-Networks.tex
cd ../..

#
#   G5029 - Limits of Computation
#

cd "Year 3/Limits of Computation"
pdflatex Limits-of-Computation.tex
cd ../..
