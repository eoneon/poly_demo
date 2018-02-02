class Item < ApplicationRecord
  belongs_to :itemizable, polymorphic: true
end
