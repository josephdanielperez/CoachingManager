class AddTakenToEmployeeTimes < ActiveRecord::Migration[6.0]
  def change
    add_column :employee_times, :taken?, :boolean
  end
end
