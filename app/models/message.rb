class Message < ActiveRecord::Base
  attr_accessible :content
  
  belongs_to :board_member
  belongs_to :board  

  validates :board, :board_member, :content, presence: true
end
