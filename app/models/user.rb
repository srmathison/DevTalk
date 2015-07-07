class User < ActiveRecord::Base
  
  # when user deletes account they can delete comments & posts assiciated with a deleted user account
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

end

