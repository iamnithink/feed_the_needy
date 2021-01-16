class CreateFoods < ActiveRecord::Migration[6.0]
  def change
    create_table :foods do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :address
      t.text :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
