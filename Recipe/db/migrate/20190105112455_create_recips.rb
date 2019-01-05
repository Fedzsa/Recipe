class CreateRecips < ActiveRecord::Migration[5.2]
  def change
    create_table :recips do |t|
      t.string :name
      t.text :description
      t.timestamps
    end

    create_table :recips_ingredients do |t|
      t.belongs_to :recips, index: true
      t.belongs_to :ingredients, index: true
      t.timestamps
    end
  end
end
