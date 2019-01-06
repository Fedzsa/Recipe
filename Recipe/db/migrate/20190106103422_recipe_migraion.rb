class RecipeMigraion < ActiveRecord::Migration[5.2]
  def change
    create_table :recips do |t|
      t.string :name
      t.text :description
      t.integer :user_id
      t.timestamps
    end

    create_table :ingredients do |t|
      t.string :name
      t.timestamps
    end

    create_table :comments do |t|
      t.text :comment
      t.timestamps
    end

    create_table :ingredients_recips, id: false do |t|
      t.belongs_to :recip, index: true
      t.belongs_to :ingredient, index: true
      t.timestamps
    end

    create_table :recips_users, id: false do |t|
      t.belongs_to :recips, index: true
      t.belongs_to :users, index: true
      t.timestamps
    end

    create_table :recips_comments, id: false do |t|
      t.belongs_to :recips, index: true
      t.belongs_to :comments, index: true
      t.timestamps
    end
  end
end
