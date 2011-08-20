$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

module Flickruby
  VERSION = '0.0.1'
  API_KEY  = "3677f98d425aa787a284096d7a31de8c"
end
#!/usr/bin/env ruby
require 'rubygems'
require 'rainbow'
require 'flickruby/colors'
require 'flickruby/groups'
require 'flickruby/user'
require 'flickruby/photo'
require 'flickruby/config'
require 'flickruby/api' 
include Flickruby
include Flickruby::Config
include Flickruby::Api  

PHOTO_IDS = [ "5674877893" , "5650164332", "6000714563" ]

PHOTO_IDS.each do |photo_id|
  photo = Photo.new(photo_id)
  puts "======================================================="
  puts  photo.title
  puts "======================================================="  
  photo.awards.each do |award|
    print "\nAwards for "
    print award[:name].color(award[:color])
    print " => "
    print award[:count].to_s.color(:yellow) 
  end
  puts "\n-------------------------------------------------------"
end
