require 'securerandom'

class ShortenedUrl < ApplicationRecord

    include SecureRandom

    validates :long_url, presence: true, uniqueness: true
    validates :user_id, presence: true

    belongs_to(
        :submitter,
        primary_key: :id,
        foreign_key: :user_id,
        class_name: :User
    )


    def random_code
        rando_code = ""

        rando_code = SecureRandom.urlsafe_base64
        while ShortenedUrl.exists?(:short_url => rando_code)
            rando_code
        end

        rando_code
        # "a"
    end


    def shortener(user, lg_url)
        self.long_url = lg_url
        self.user_id = user.id
        # self.short_url = "aa"
        y = self.random_code
        self.short_url = "shorturl.com/" + y
    end
end