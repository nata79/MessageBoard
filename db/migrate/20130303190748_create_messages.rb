class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :content
      t.references :board_member
      t.references :board

      t.timestamps
    end
    add_index :messages, :board_member_id
    add_index :messages, :board_id
  end
end
