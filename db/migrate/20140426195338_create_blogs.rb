class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.integer :article_count
      t.string :title
      t.string :last_article_date

      t.timestamps
    end
  end
end
