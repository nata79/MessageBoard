class Message < ActiveRecord::Base
  belongs_to :board_member
  belongs_to :board
  attr_accessible :content
end
