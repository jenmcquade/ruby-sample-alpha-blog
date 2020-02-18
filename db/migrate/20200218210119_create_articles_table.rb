class CreateArticlesTable < ActiveRecord::Migration[5.2]
  def change
    create_table :articles_tables do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
