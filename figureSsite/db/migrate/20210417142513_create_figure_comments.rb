class CreateFigureComments < ActiveRecord::Migration[5.2]
  def change
    create_table :figure_comments do |t|
      t.text :comment
      t.integer :user_id
      t.integer :figure_id

      t.timestamps
    end
  end
end
