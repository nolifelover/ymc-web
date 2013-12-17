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
end
