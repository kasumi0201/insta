class AddEditToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :position, :string
    add_column :users, :s_introduction, :text
  end
end
