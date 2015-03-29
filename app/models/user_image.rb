class UserImage < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  belongs_to :user

 #  validates :user_id, uniqueness: true

  # しっかり登録されるが、再度edit画面に飛んだ際にデータが空になる
  
end
