#!/bin/bash

apt install texlive-full

#
#   Computer Networks
#
cd "Year 2/Computer Networks"
pdflatex "Computer Networks.tex"
mv "Computer Networks.pdf" "../../G5115 - Computer Networks.pdf"

#
#    Operating Systems
#
cd "../Operating Systems"
pdflatex "Operating Systems.tex"
mv "Operating Systems.pdf" "../../G6059 - Operating Systems.pdf"

