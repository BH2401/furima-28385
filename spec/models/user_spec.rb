require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it 'nickname,email,password,password_confirmation,last_name,first_name,last_name_kana,first_name_kana,birth_dateが存在すれば登録できること' do
      expect(@user).to be_valid
    end

    it 'nicknameが空では登録できないこと' do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空では登録できないこと' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'emailに＠を含まない場合登録できないこと' do
      @user.email = 'aaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end

    it '重複したemailが存在する場合登録できないこと' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it 'passwordが空では登録できないこと' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'passwordが5文字以下であれば登録できないこと' do
      @user.password = 'abc12'
      @user.password_confirmation = 'abc12'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'passwordが全角であれば登録できないこと' do
      @user.password = 'ああああああ'
      @user.password_confirmation = 'ああああああ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
    end

    it 'passwordが英字だけでは登録できないこと' do
      @user.password = 'abcdef'
      @user.password_confirmation = 'abcdef'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
    end

    it 'passwordが数字だけでは登録できないこと' do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
    end

    it 'passwordとpassword_confirmationが不一致では登録できないこと' do
      @user.password = 'abc123'
      @user.password_confirmation = 'abc1234'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'passwordは6文字以上半角英数字混合であれば登録できること' do
      @user.password = 'abc123'
      @user.password_confirmation = 'abc123'
      expect(@user).to be_valid
    end

    it 'last_nameが空では登録できないこと' do
      @user.last_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it 'last_nameが全角でないと登録できないこと' do
      @user.last_name = 'yamada'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name Full-width characters')
    end

    it 'first_nameが空では登録できないこと' do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it 'first_nameが全角でないと登録できないこと' do
      @user.first_name = 'rikutarou'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name Full-width characters')
    end

    it 'last_name_kanaが空では登録できないこと' do
      @user.last_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end

    it 'last_name_kanaが全角でないと登録できないこと' do
      @user.last_name_kana = 'ﾔﾏﾀﾞ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name kana Full-width katakana characters')
    end

    it 'first_name_kanaが空では登録できないこと' do
      @user.first_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end

    it 'first_name_kanaが全角でないと登録できないこと' do
      @user.first_name_kana = 'ﾘｸﾀﾛｳ'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana Full-width katakana characters')
    end
  end
end
