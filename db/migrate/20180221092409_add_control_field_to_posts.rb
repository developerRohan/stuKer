class AddControlFieldToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :error, :text
  end
end
