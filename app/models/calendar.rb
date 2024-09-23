class Calendar < ApplicationRecord
  belongs_to :room
  belongs_to :rate_plan
end
