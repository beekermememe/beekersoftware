class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :content
      t.string :title
      t.string :author
      t.string :date_published
      t.integer :author_id
      t.integer :word_count

      t.timestamps
    end
  end
end
