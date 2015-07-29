class Celeb < ActiveRecord::Base
  default_scope  { order(:view => :desc) }


  has_many  :videos

  def count_reset

    celeb_view = 0
    self.videos.each do |video|
      celeb_view = celeb_view + video.view
    end

    self.view = celeb_view
    self.save

  end

end
