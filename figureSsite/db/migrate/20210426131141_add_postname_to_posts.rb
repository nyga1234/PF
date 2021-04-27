class AddPostnameToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :postname, :string
  end
end
