class Group < ActiveRecord::Base
	has_many :users

	def set_group_id_nil=(group)
	  @group = group
	  @group.users.each do |user|
	    user.group = nil
	 end
	end

  end

