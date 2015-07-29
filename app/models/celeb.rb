class Celeb < ActiveRecord::Base
  default_scope  { order(:view => :desc) }

  has_many  :videos
  has_many  :snapcelebs

  def snapshot(id)

    total = 0

    self.videos.each do |video|
      total = total + video.snapshot(id)
    end
    
    snapceleb = Snapceleb.new
    snapceleb.view = total
    snapceleb.celeb_id = self.id
    snapceleb.snap_id = id
    snapceleb.save

    self.view = total
    self.save

    return total

  end

  def get_index
    index = 0
    Celeb.all.each do |celeb|
      index = index + 1
      if celeb == self
        return index
      end
    end

  end

  def count_reset

    celeb_view = 0
    self.videos.each do |video|
      celeb_view = celeb_view + video.view
    end

    self.view = celeb_view
    self.save

  end

end
