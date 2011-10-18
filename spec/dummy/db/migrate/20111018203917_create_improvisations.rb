class CreateImprovisations < ActiveRecord::Migration
  def change
    create_table :improvisations do |t|
      t.string :name

      t.timestamps
    end
  end
end
