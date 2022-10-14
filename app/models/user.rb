class User < ApplicationRecord

    has_secure_password
    has_one_attached :file

    has_many :requests, dependent: :destroy

end
