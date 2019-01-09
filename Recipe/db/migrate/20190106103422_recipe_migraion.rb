class RecipeMigraion < ActiveRecord::Migration[5.2]
  def change
    create_table :recips do |t|
      t.string :name
      t.text :description
      t.integer :foodtype
      t.belongs_to :user, index: true
      t.timestamps
    end

    create_table :ingredients do |t|
      t.string :name
      t.timestamps
    end

    create_table :comments do |t|
      t.text :comment
      t.belongs_to :user, index: true
      t.timestamps
    end

    create_table :ingredients_recips, id: false do |t|
      t.belongs_to :recip, index: true
      t.belongs_to :ingredient, index: true
      t.timestamps
    end

    create_table :comments_recips, id: false do |t|
      t.belongs_to :recip, index: true
      t.belongs_to :comment, index: true
      t.timestamps
    end

  end
end
