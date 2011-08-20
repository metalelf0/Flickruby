module Flickruby
  class User
    
    def initialize user_id
      @user_id = user_id
    end
    
    def photo_ids
      doc = api_call("flickr.people.getPublicPhotos", :user_id => @user.id)
      return doc.xpath("//photo/id").map(&:content)
    end
    
  end
end
