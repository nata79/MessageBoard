class Board < ActiveRecord::Base
  attr_accessible :name

  belongs_to :user
  has_many :members, class_name: 'BoardMember', dependent: :destroy

  after_create :set_creator_as_admin

private
  def set_creator_as_admin
    members.create!{ |m| m.user = user; m.role = 'admin' }
  end
end
