class AddTodosCountToUser < ActiveRecord::Migration
  def change
    add_column :users, :todos_count, :integer, default: 0
  end
end
