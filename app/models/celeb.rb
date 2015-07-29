class Celeb < ActiveRecord::Base
  default_scope  { order(:view => :desc) }

  has_attached_file :face, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  has_attached_file :emblem, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"

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
