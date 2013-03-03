class BoardMember < ActiveRecord::Base
  belongs_to :user
  belongs_to :board

  validates :user, :board, :role, presence: true
end
