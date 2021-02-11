module TestPassagesHelper

  def convert_in_time(value)
    Time.at(value).utc.strftime("%H:%M:%S")
  end

end
