class RenameTopictitleColumnToTopics < ActiveRecord::Migration[5.2]
  def change
    rename_column :topics, :topictitle, :topicstitle
  end
end
