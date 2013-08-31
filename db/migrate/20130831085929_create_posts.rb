class CreatePosts < ActiveRecord::Migration
  def up
    create_table :posts do |t|
      t.references :subsite, index: true
      t.boolean :promoted, :null => false, :default => false
      t.boolean :published, :null => false, :default => false
      t.string :slug
      t.datetime :published_at
      t.string :postimage
      t.references :posted_by, index: true
      t.references :last_edited_by, index: true
      t.boolean :post_as_supermarket, :null => false, :default => false
      t.timestamps
    end
    Post.create_translation_table! :subject => :string, :body => :text
  end
  def down
    drop_table :posts
    Post.drop_translation_table!
  end
  
end
