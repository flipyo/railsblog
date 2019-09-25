class Article < ApplicationRecord
belongs_to :user
has_many :image
mount_uploader :image, ImageUploader
validates :image, file_size: { less_than: 1.megabytes }
validates :title, presence: true,
                    length: { minimum: 5 }

end
