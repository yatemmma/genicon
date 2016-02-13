require 'minitest/autorun'
require 'minitest-power_assert'
require './icon_generator'

module Genicon
  class IconGeneratorTest < Minitest::Test
    def teardown
      system "rm difference.png test/*_result.png"
    end
    
    def test_solid_icon
      IconGenerator.new.generate(color: 'lightblue', filename: 'test/solid_result.png')
      assert { 0 == diff('test/solid_expect.png', 'test/solid_result.png') }
    end
    
    def diff(image1, image2)
      system "composite -compose difference #{image1} #{image2} difference.png"
      result = `identify -format \"%[mean]\" difference.png`
      result.to_i
    end
  end
end
