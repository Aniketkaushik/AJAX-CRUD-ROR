class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :task_name
      t.date :due_date
      t.boolean :status

      t.timestamps
    end
  end
end
