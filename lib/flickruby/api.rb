require 'open-uri'
require 'nokogiri'

module Flickruby
  module Api
    
    # call this like:
    # api_call("flickr.photos.getInfo", :photo_id => "...")
    def api_call(method, params)
      url = "#{REST_PATH}?method=#{method}&api_key=#{API_KEY}"
      params.each_pair do |param_name, param_value|
        url += "&#{param_name.to_s}=#{param_value}"
      end
      doc = Nokogiri::XML(open(url))
    end
    
  end
end