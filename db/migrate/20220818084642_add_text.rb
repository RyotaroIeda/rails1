class AddText < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :text, :text
  end
end
