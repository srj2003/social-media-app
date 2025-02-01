class User < ApplicationRecord
    has_secure_password
    validates_uniqueness_of :email, :username

    has_many :posts

    def as_json(options={})
        super(except: [:password_digest, :created_at, :updated_at])
    end
end
