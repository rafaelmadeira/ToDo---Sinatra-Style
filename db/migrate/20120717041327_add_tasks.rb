class AddTasks < ActiveRecord::Migration
  def up
  	create_table :added_tasks do |t|
  		t.string :task
  	end
  end

  def down
  	drop_table :added_tasks
  end
end
