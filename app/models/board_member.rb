class BoardMember < ActiveRecord::Base
  attr_accessible :user_id

  belongs_to :user
  belongs_to :board

  validates :user, :board, :role, presence: true
end
