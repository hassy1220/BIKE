class PostBikeComment < ApplicationRecord
  belongs_to:user
  belongs_to:post_bike
end
