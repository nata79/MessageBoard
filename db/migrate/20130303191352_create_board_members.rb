class CreateBoardMembers < ActiveRecord::Migration
  def change
    create_table :board_members do |t|
      t.string :role
      t.references :user
      t.references :board

      t.timestamps
    end
    add_index :board_members, :user_id
    add_index :board_members, :board_id
  end
end
