require 'rmagick'

module Genicon
  class IconGenerator
    def generate(
      filename: 'output/sample.png',
      w: 114,
      width: w,
      h: 114,
      height: h,
      color: '#CCC',
      colors: [color],
      direction: 'vertical',
      rotate: 0
    )
    
      if rotate != 0
        org_width = width
        org_height = height
        width = height = (width**2 + height**2)**(1/2.0)
      end
    
      color_num = colors.size
    
      base_image = Magick::Image.new(width, height) do
        self.background_color = colors.shift
      end
      
      colors.reverse.each_with_index do |color, i|
        w = (direction == 'vertical') ? width/color_num : width
        h = (direction == 'horizontal') ? height/color_num : height
        image = Magick::Image.new(w, h) do
          self.background_color = color
        end
        x = (direction == 'vertical') ? width - (w*(i+1)) : 0
        y = (direction == 'horizontal') ? height - (h*(i+1)) : 0
        base_image = base_image.composite(image, x, y, Magick::OverCompositeOp)
      end
      
      if rotate != 0
        base_image = base_image.rotate(rotate)
        base_image = base_image.crop((width - org_width)/2, (height - org_height)/2, org_width, org_height)
      end
      
      base_image.write(filename)
      self
    end
  end
end
