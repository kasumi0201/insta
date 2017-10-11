class AddNameToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :name, :string, null: false, default: ""
    # name フィールドは、入力必須で重複OKなフィールドにします。（ユニークキーは付けない。
  end
end
