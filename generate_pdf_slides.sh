#! /bin/bash


PDFLATEX="/usr/local/texlive/2026/bin/x86_64-linux/pdflatex"


echo "Number of command line arguments = $#"


display_usage() {

    echo ""
    echo "Compile the LaTeX source code into a PDF file(s)."
    echo ""
    echo "Usage :"
    echo ""
    echo "  build_slides.sh [light | dark]" filename.tex
    echo ""
    echo ""
    echo "The PDF files can be instructed to use either a light theme or a dark theme."
    echo ""

}

if [ $# -eq 2 ];
then

    # Exactly two command line arguments were supplied to this script.
    #
    #   - Arg 1 : Color theme selection
    #   - Arg 2 : Filename of main .tex file

    # Get the selection for the color theme and set its value to lowercase.

    color_theme=${1,,}
    filename=$2

    echo "Color theme selected = ${color_theme}"
    echo "Filename             = ${filename}"

    read -p "Press Enter to continue..."

    case "${color_theme}" in
        light)
            ${PDFLATEX} --shell-escape "\"\def\theme{light}\input{${filename}}\""
            ;;
        dark)
            ${PDFLATEX} --shell-escape "\"\def\theme{dark}\input{${filename}}\""
            ;;
        *)
            display_usage
            ;;
    esac

else

    # Exactly two command line arguments were not supplied to this script.

    display_usage

fi
