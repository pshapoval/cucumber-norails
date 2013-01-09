class CreateTestTable < ActiveRecord::Migration
  def self.up
    create_table :test_table do |t|
      t.column :test_column, :string, :null => false
    end
  end

  def self.down
    drop_table :test_table
  end
end
