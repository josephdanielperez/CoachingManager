class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.integer :employee_id
      t.integer :user_id
      t.boolean :user_checked_in?
      t.datetime :time

      t.timestamps
    end
  end
end
