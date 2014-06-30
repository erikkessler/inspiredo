class CreateFeedItems < ActiveRecord::Migration
  def change
    create_table :feed_items do |t|
      t.string :content
      t.references :user, index: true

      t.timestamps
    end
  end
end
