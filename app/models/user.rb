class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, :birth_date, presence: true

  validates :email, 
            # 重複不可
            uniqueness: true
            # 英数字のみ可,@を挟んだemailの形になっているか
            # /^\S+@\S+\.\S+$/   /\A[a-z0-9]+\z/i  /^[a-zA-Z0-9]+$/
            # format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: "is must NOT contain any other characters than alphanumerics." }

  validates :password, 
            # 半角英数字のみ可
            format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,20}+\z/i, message: "Include both letters and numbers"}

  validates :last_name, presence: true,
            # 全角ひらがな、全角カタカナ、漢字
            format: { with:/\A[ぁ-んァ-ン一-龥]/, message: "Full-width characters"}

  validates :first_name, presence: true,
            # 全角ひらがな、全角カタカナ、漢字
            format: { with:/\A[ぁ-んァ-ン一-龥]/, message: "Full-width characters"}

  validates :last_name_kana, presence: true, 
            # 全角カナのみ可
            format: { with: /\A([ァ-ン]|ー)+\z/, message: "Full-width katakana characters"}

  validates :first_name_kana, presence: true, 
            # 全角カナのみ可
            format: { with: /\A([ァ-ン]|ー)+\z/, message: "Full-width katakana characters"}

end
