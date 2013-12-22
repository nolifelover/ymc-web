#encoding: utf-8
# Helper methods defined here can be accessed in any controller or view in the application

Ymc::App.helpers do
  # def simple_helper_method
  #  ...
  # end

  def exam_date(level)
  	if level.to_i == 1
  		"21 ธันวาคม 2556"
  	else
  		"22 ธันวาคม 2556"
  	end
  end

  def display_level(level)
  	if level.to_i == 1
  		"ประถมศึกษา"
  	else
  		"มัธยมศึกษา"
  	end
  end

  def room_number(room)
  	room.gsub("ห้อง","")
  end

  def dash_display(val)
    if val.nil? || val == ""
      return "-"
    else
      return val
    end
  end

  def display_mean(val)
    if val.to_i == 1
      "17.34"
    else
      "24.59"
    end
  end

  def display_sd(val)
    if val.to_i == 1
      "13.66"
    else
      "16.95"
    end
  end
end
