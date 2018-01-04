class CreateActiverecordTimelineTimeLineRecords < ActiveRecord::Migration[5.1]
  def change
    create_table :time_line_records do |t|
      t.belongs_to :target, polymorphic: true
      t.belongs_to :executor, polymorphic: true
      t.string :event_type
      t.json :old_values
      t.json :new_values
      t.timestamps
    end
  end
end
