class CreateFigures < ActiveRecord::Migration[5.2]
  def change
    create_table :figures do |t|
      t.string :title
      t.string :figure_image_id
      t.text :description
      t.integer :user_id

      t.timestamps
    end
  end
end
