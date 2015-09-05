class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.date :visit
      t.integer :pet_id
      t.integer :customer_id
      t.boolean :reminder
      t.string :reason

      t.timestamps null: false
    end
  end
end
