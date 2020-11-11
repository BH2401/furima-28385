class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, :first_name, :last_name, :birth_date, presence: true
  validates :password, 
            # 英数字のみ可
            format: { with: /\A[a-z0-9]+\z/i, message: "is must NOT contain any other characters than alphanumerics." }
  validates :email, 
            # 重複不可
            uniqueness: true
            # 英数字のみ可,@を挟んだemailの形になっているか
            # /^\S+@\S+\.\S+$/   /\A[a-z0-9]+\z/i  /^[a-zA-Z0-9]+$/
            # format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: "is must NOT contain any other characters than alphanumerics." }
  validates :last_name_kana, :first_name_kana, presence: true, 
            # カナのみ可
            format: { with: /\A([ァ-ン]|ー)+\z/, message: "is must NOT contain any other characters than alphanumerics." }

end
