class ExamRoom < ActiveRecord::Base
	def fullname
		"#{self.title}#{self.firstname}  #{self.lastname}"
	end
end
