module ActiverecordTimeline
  class TimeLineRecord < ApplicationRecord
    self.table_name = 'time_line_records'
    belongs_to :target, polymorphic: true
    belongs_to :executor, polymorphic: true
  end
end
