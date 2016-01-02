
module Weather

  def report_weather
    if rand(0..99)==0 then @weather=:stormy else @weather=:sunny end
  end

end
