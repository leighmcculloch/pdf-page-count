# pdf-page-count

A command line application that will count the number of pages in multiple or individual PDFs. It can recursively traverse multiple directories and sum the total pages.

Enable verbose output to see each individual PDF's page count when doing so.

Uses [PDF::Reader library](http://github.com/yob/pdf-reader) to count pages.

# Installation

The recommended installation method is via Rubygems.

	gem install pdf-reader

# Usage

	Usage: pdf-page-count [options] [file/path] [file/path] ...
	
	Options
	    -R, --recursive                  Recursively search for .pdf 	files
	    -v, --[no-]verbose               Run verbosely
	    -h, --help                       help

# Examples

Count the pages in a single PDF.

	Puter:~ user$ pdf-page-count 1.pdf

Count the pages in a multiple individual PDFs.

	Puter:~ user$ pdf-page-count 1.pdf morefiles/2.pdf

Count the pages in PDFs contained in a directory.

	Puter:~ user$ pdf-page-count morefiles

Count the pages in PDFs contained in a directory and it's subdirectories recursively.

	Puter:~ user$ pdf-page-count -R morefiles	

# Licence

See [LICENCE](LICENSE)