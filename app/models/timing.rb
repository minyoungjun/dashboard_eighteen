class Timing < ActiveRecord::Base

  def snap
    
    snaps = Snap.where(:timing_id => self.id)

    if snaps.count != 0
      result = snaps.first  
    else
      result = Snap.first
    end

    return result

  end
end
