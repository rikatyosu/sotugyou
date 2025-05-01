class Car < ApplicationRecord
has_one_attached :image, dependent: :purge_later
end
