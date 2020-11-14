class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :birth_date
    validates :password, 
              # 半角英数字のみ可
              format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,20}+\z/i, message: "Include both letters and numbers"}

    validates :last_name,
              # 全角ひらがな、全角カタカナ、漢字
              format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "Full-width characters"}

    validates :first_name,
              # 全角ひらがな、全角カタカナ、漢字
              format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "Full-width characters"}

    validates :last_name_kana,
              # 全角カナのみ可
              format: { with: /\A([ァ-ン]|ー)+\z/, message: "Full-width katakana characters"}

    validates :first_name_kana,
              # 全角カナのみ可
              format: { with: /\A([ァ-ン]|ー)+\z/, message: "Full-width katakana characters"}
  end

end
