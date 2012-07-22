IPTC-data-reader
================

Reads IPTC and EXIF data using a number of gems (RMagick, Mini_exiftool, XMP and Exifr)

---- THIS REPO IS UNDER HEAVY DEVELOPMENT - THINK TWICE BEFORE FORKING ----

First note: I'm a newbie at ruby and rails so please don't pay any attention to the programming, I know it's ugly.
Second note: This repo is for testing the best gem available for reading IPTC and EXIF data with the main focus on IPTC data. The following gems have been investigated:
- exifr (only gives exif data -> no surprise there)
- xmp (not reading all image files, assuming I didn't make a mistake somewhere ofcourse)
- mini_magick (only gives exif data)
- rmagick (gives some IPTC data, but only in 1 long string, no seperate hashes)
- iptc (couldn't get it to work with my files, spend almost a day on it and then gave up)
- mini_exiftool (Read all the files and gave the most IPTC data. Biggest drawback: you have to install the exiftool command line tool)

Preliminary conclusion: mini_exiftool looks like the best option, but is the most difficult to implement. The exiftool command line tool is not supported by Heroku by default.

Installation requirements:
Exiftool command line tool:
http://www.sno.phy.queensu.ca/~phil/exiftool/install.html

For Heroku deployment:
I don't know how it works but according to this repo you can get a custom heroku buildpack with exiftool support if you use the following repo:
https://github.com/GBognar/heroku-buildpack-ruby

Notes on using the test data:
All the test images are located under:
"app/assets/images/"

Select an image by editing: "app/controllers/pic_reader_controller.rb"
Edit the following line:
@Photo_Select = @Photo_A (or @Photo_B etc.)

Examine the IPTC and Exif data by going to the following page:
"localhost:3000/pic_reader/home"

The following images give errors while trying to read the IPTC data using xmp:
"pic1.jpg", "Foto-C_IrfanView-v4.33.JPG", "Foto-E_Adobe-Lightroom-v4.1.JPG", "Foto-F_Aperture-v3.1.JPG"

You can still visit the page if you comment out the following lines for these files:
  @xmp = XMP.parse(@exifr)
	@xmp_value = true

Any comments, improvements (especially on the XMP errors) are highly appreciated.

The following photos have error
