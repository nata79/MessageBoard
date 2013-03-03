class Board < ActiveRecord::Base
  attr_accessible :name

  belongs_to :user
  has_many :members, class_name: 'BoardMember', dependent: :destroy
  has_many :messages, dependent: :destroy

  after_create :set_creator_as_admin

  def is_member? user
    members.exists? user_id: user.id
  end

  def member_from_user user
    members.where(user_id: user.id).first
  end
private
  def set_creator_as_admin
    members.create!{ |m| m.user = user; m.role = 'admin' }
  end
end
