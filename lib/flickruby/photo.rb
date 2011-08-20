module Flickruby
  class Photo
  
  def initialize photo_id
    @photo_id = photo_id
  end
  
  def title
    doc = api_call("flickr.photos.getInfo", :photo_id => @photo_id)
    return doc.xpath("//photo/title")[0].content
  end
  
  def comments
    doc = api_call("flickr.photos.comments.getList", :photo_id => @photo_id)
    return doc.xpath("//comment").map(&:content)
  end
  
  def awards
    awards = []
    comments = comments()
    Groups::GROUP_IDS.each do |group|
      awards_count = comments.select {|comment| comment.include?(group[:key])  }.size
      awards << { 
        :name => group[:name], 
        :count => awards_count, 
        :color => group[:color] 
      } unless (awards_count == 0)
    end
    return awards
  end
    
  end
end