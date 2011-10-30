class CreateConcertos < ActiveRecord::Migration
  def change
    create_table :concertos do |t|
      t.string :name

      t.timestamps
    end
  end
end
