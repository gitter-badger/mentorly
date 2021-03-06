class Group < ActiveRecord::Base

	has_and_belongs_to_many(:users)
	has_many :group_messages

	validates :name, presence: true, uniqueness: true

end
