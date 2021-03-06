class CreateInterventions < ActiveRecord::Migration[5.2]
  def change
    create_table :interventions do |t|
      t.references :author, foreign_key: { to_table: 'employees' }, :null => false
      t.references :customer, foreign_key: { to_table: 'customers' }, :null => false
      t.references :building, foreign_key: { to_table: 'buildings' }, :null => false
      t.references :battery, foreign_key: { to_table: 'batteries' }
      t.references :column, foreign_key: { to_table: 'columns' }
      t.references :elevator, foreign_key: { to_table: 'elevators' }
      t.references :employee, foreign_key: { to_table: 'employees' }
      t.datetime :start_date
      t.datetime :end_date
      t.string :result, :default => "Incomplete"
      t.text :report
      t.string :status, :default => "Pending"
      t.timestamps
    end
  end
end
