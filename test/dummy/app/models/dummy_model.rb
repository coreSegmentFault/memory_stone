class DummyModel < ApplicationRecord
  include ActiverecordTimeline::TimeLineEvented
  belongs_to :dummy_companion
  declares_line_point :modified, on: :save, attributes: [:property_a], executor: :dummy_companion
end
