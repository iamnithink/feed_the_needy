class CreateFoods < ActiveRecord::Migration[6.0]
  def change
    create_table :foods do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :address
      t.string :food_type
      t.text :description
      t.string :user_type
      t.string :number_of_plate
      t.string :assigned_user
      t.boolean :status, default: false

      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
