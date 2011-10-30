CanTango.configure do |config|
  config.guest.user Proc.new { Guest.new }
  config.engines.all :on
end
