class DeleteUserIdFromMessages < ActiveRecord::Migration[5.1]
  def up
    remove_reference :messages, :user, index: true
  end

  def down
    add_reference :messages, :user, index: true
  end
end
