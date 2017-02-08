class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.string :title
      t.datetime :published
      t.boolean :is_approved
      t.text :content

      t.timestamps
    end
  end
end