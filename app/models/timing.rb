class Timing < ActiveRecord::Base

  def snap
    
    if self.snap_id != nil
      result = Snap.find(self.snap_id) 
    else
      result = Snap.first
    end

    return result

  end
end
