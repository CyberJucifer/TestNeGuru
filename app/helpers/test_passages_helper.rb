module TestPassagesHelper

  def convert_in_time(value)
    value_in_seconds = value*60
    Time.at(value_in_seconds).utc.strftime("%H:%M:%S")
  end

end
