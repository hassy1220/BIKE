class PostTag < ApplicationRecord
  belongs_to:post_bike
  belongs_to:tag
end
