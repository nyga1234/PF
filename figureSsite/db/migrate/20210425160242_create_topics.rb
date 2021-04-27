class CreateTopics < ActiveRecord::Migration[5.2]
  def change
    create_table :topics do |t|
      t.string :topictitle

      t.timestamps
    end
  end
end
