class Snap < ActiveRecord::Base
  has_many  :snapvideos
  has_many  :snapclips
  has_many  :snapcelebs

  def snapshot

    total = 0
    Celeb.all.each do |celeb|
      total = total + celeb.snapshot(self.id)
    end

    return total

  end


end
