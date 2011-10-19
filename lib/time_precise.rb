require 'time'

class Time
  def precise
    self.strftime("%s%L").to_i
  end
end
