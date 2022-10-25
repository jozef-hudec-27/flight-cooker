class DropFlightDurationAndCreateNewWithInteger < ActiveRecord::Migration[7.0]
  def up
    remove_column :flights, :duration
    add_column :flights, :duration, :integer, null: false
  end

  def down
    remove_column :flights, :duration
    add_column :flights, :duration, :time, null: false
  end
end
