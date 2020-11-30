class CreateServices < ActiveRecord::Migration[6.0]
  def change
    create_table :services do |t|
      t.string :name
      t.integer :employee_id
      
      t.timestamps
    end
  end
end
