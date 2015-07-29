class Clip < ActiveRecord::Base
  belongs_to  :video
  has_many  :snapclips

  def snapshot(id)

    snapclip = Snapclip.new
    snapclip.snap_id = id
    snapclip.view = self.view
    snapclip.clip_id = self.id
    snapclip.save

    return self.view

  end
end
