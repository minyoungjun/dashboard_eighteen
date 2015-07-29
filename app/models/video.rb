class Video < ActiveRecord::Base
  has_many :clips
  belongs_to  :celeb

  def facebook_clip

    return self.clips.where(:source => 0).first

  end

  def facebook

    fb_clip = self.facebook_clip
    facebook_id = fb_clip.source_id

    doc = JSON.parse(open("https://graph.facebook.com/v2.4/#{Fbtoken.my_page}_#{facebook_id}/insights/post_video_views?access_token=#{Fbtoken.fresh}").read)["data"]
    like = JSON.parse(open("https://graph.facebook.com/v2.4/#{Fbtoken.my_page}_#{facebook_id}/likes?access_token=#{Fbtoken.fresh}&summary=true").read)["summary"]["total_count"]
    comment = JSON.parse(open("https://graph.facebook.com/v2.4/#{Fbtoken.my_page}_#{facebook_id}/comments?access_token=#{Fbtoken.fresh}&summary=true").read)["summary"]["total_count"]
    share = JSON.parse(open("https://graph.facebook.com/v2.4/#{Fbtoken.my_page}_#{facebook_id}/sharedposts?access_token=#{Fbtoken.fresh}&summary=true").read)

    fb_clip.view = doc[0]["values"][0]["value"].to_i
    fb_clip.save

    self.count_reset

    return {"count" => fb_clip.view, "like" => like, "comment" => comment, "share" => share}
  end

  def count_reset

    video_view = 0

    self.clips.each do |clip|
      video_view = video_view + clip.view
    end 

    self.view = video_view
    self.save

    self.celeb.count_reset

  end

  def has_twitter?
    return false

  end

  def has_youtube?
    return false
  end

end
