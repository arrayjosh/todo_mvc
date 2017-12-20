class AddClapsToArticles < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :claps, :integer, null: false, default: 0
  end
end
