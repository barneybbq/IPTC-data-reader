class PicReaderController < ApplicationController

require 'RMagick'
require 'mini_exiftool'

  def home
  	@mini_exiftool_value = false
  	@xmp_value = false

  	@multiple_app1 = "app/assets/images/multiple-app1.jpg"
  	@pic1 = "app/assets/images/pic1.jpg" #XMP error
  	@Photo_A = "app/assets/images/Foto-A_Windows-verkenner.JPG"
  	@Photo_B = "app/assets/images/Foto-B_Adobe-Bridge-CS5.JPG"
  	@Photo_C = "app/assets/images/Foto-C_IrfanView-v4.33.JPG" # XMP has error
  	@Photo_D = "app/assets/images/Foto-D_ACDSee-Pro-5.JPG"
  	@Photo_E = "app/assets/images/Foto-E_Adobe-Lightroom-v4.1.JPG" #XMP has error
	@Photo_F = "app/assets/images/Foto-F_Aperture-v3.1.JPG" #XMP has error

  	@Photo_Select = @Photo_A
    
    @exifr = (EXIFR::JPEG.new(@Photo_Select))
	@xmp = XMP.parse(@exifr)
	@xmp_value = true
	@rmagick = Magick::Image.read(@Photo_Select).first

    @mini_exiftool = MiniExiftool.new(@Photo_Select, :convert_encoding => true)
    @mini_exiftool_value = true
  end

end
