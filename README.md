## No longer actively developed
I [rewrote this in Javascript](https://github.com/motevets/hexaflexago). Any new feature work will happen there.

# Hexflex
Hexflex is a Ruby gem and command-line tool for automatically generating
[hexaflexagon] templates.

## Installation

    gem install 'hexaflexa'

...or you can put it in your Gemfile.

## Usage

### as a gem in your ruby project

To create an [RVG] object containing a vector of the hexaflexagon template:

    Hexflex.make_template_vector(side_fills: ARRAY_OF_SIDE_FILLS, template: TEMPLATE)

To save the hexaflexagon template as a file to the disk:

    Hexflex.create_template_image!(side_fills: ARRAY_OF_SIDE_FILLS, template: TEMPLATE, output_file_name: OUTPUT)

Where:
- a `SIDE_FILL` is a [standard X color] or path to file for a side of the hexaflexagon.  Either three or zero sides should be specified.  The default are cyan, magenta, and yellow.
- `TEMPLATE` is template the form for the hexaflexagon. It can either be "tape" or "glue". The default is "tape".
- `OUTPUT` is a path to save the hexaflexagon template image. The default is "out.png".

### as a command-line tool

    hexflex [-s SIDE_FILL -s SIDE_FILL -s SIDE_FILL] [-t TEMPLATE] [-o OUTPUT]

See above for definitions of `SIDE_FILL`, `TEMPLATE`, AND `OUTPUT`.

[hexaflexagon]: https://en.wikipedia.org/wiki/Flexagon#Trihexaflexagon
[standard X color]: https://en.wikipedia.org/wiki/X11_color_names
[RVG]: https://rmagick.github.io/rvg.html
