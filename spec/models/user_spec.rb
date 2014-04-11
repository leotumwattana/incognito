require 'spec_helper'

describe User do

  before :each do
    @user = User.create(email: 'kulio@gmail.com', password: '1234', password_confirmation: '1234')
  end

  describe "associations" do
    it { should have_many(:events).through(:participations) }
    it { should have_many :stats }
    it { should have_many :messages }
    it { should have_and_belong_to_many :tasks }
  end

  describe "validations" do
    context "email" do
      it { should validate_presence_of :email }
    end
  end

  describe "when password is provided" do

    it "is valid with password_confirmation" do
      expect(@user).to be_valid
    end

    context "when password_confirmation is empty" do
      it "is invalid without password_confirmation" do
        @user.password_confirmation = ''
        expect(@user).to have(1).error_on(:password_confirmation)
      end
    end

    context "when password_confirmation is nil" do
      it "is valid without password_confirmation" do
        @user.password_confirmation = nil
        expect(@user).to be_valid
      end
    end
  end

  describe "authenticate username and password" do

    describe "self.authenticate" do

      context "when password is correct" do
        it "returns user" do
          user = User.authenticate 'kulio@gmail.com', '1234'
          expect(user).to be_valid
          expect(user.class).to eq User
        end
      end

      context "when password is incorrect" do
        it "returns nil" do
          user = User.authenticate 'kulio@gmail.com', '12345678'
          expect(user).to be_nil
        end
      end
    end

    describe "authenticate" do
      it "authenticates correctly" do
        user = User.find_by email: 'kulio@gmail.com'
        auth_result = user.authenticate '1234'
        result = user.fugu == BCrypt::Engine.hash_secret('1234', user.salt)
        expect(auth_result).to eq result
      end
    end
  end

  describe "reset password feature" do

    before :each do
      @user = User.find_by email: 'kulio@gmail.com'
      @user.set_password_reset
      @params = { :password => '1234', :password_confirmation => '1234' }
    end

    context "code exists after set_password_reset" do
      it "should have value set to code and expires_at" do
        @user.set_password_reset
        expect(@user.code).to_not be_nil
        expect(@user.expires_at).to_not be_nil
      end
    end

    describe "password reset" do
      context "password is blank" do
        it "should be invalid if password is blank" do
          @params[:password] = ''
          result = @user.reset_password @params
          expect(result).to be_false
        end
      end
    end

    context "when password is not blank" do
      context "when password matches confirmation" do
        it "fugu and salt changes" do
          old_fugu = @user.fugu
          @user.reset_password @params
          expect(old_fugu).to_not eq @user.fugu
        end

        it "code and expires_at is nil" do
          @user.reset_password @params
          expect(@user.code).to be_nil
          expect(@user.expires_at).to be_nil
        end
      end

      context "when password does not match confirmation" do
        it "fugu and salt is unchanged" do
          @params[:password_confirmation] = 'abcd'
          old_fugu = @user.fugu
          @user.reset_password @params
          expect(old_fugu).to eq @user.fugu
        end

        it "code and expires_at remains unchanged" do
          @params[:password_confirmation] = 'abcd'
          @user.reset_password @params
          expect(@user.code).to_not be_nil
          expect(@user.expires_at).to_not be_nil
        end
      end
    end
  end

  describe "Set random password if password is not provided" do

    before :each do
      @user = User.new email: 'kulio@gmail.com'
    end

    context "when salt and fish exists" do
      it "salt and fish has value" do
        @user.send(:set_random_password)
        expect(@user.salt).to_not be_nil
        expect(@user.fugu).to_not be_nil
      end
    end
  end

  describe "Password is encrypted before save" do

    before :each do
      @user = User.new email: 'kulio@gmail.com'
    end

    context "when password is present" do
      it "salt and fish has value" do
        @user.password = '1234'
        @user.send(:encrypt_password)
        expect(@user.salt).to_not be_nil
        expect(@user.fugu).to_not be_nil
      end

      context "encrypted password is not the same as plain" do
        it "password and fish should never be the same" do
          @user.password = '1234'
          @user.send(:encrypt_password)
          expect(@user.password).to_not eq @user.fugu
        end
      end
    end

    context "password is not present" do
      it "salt and fish are nil" do
        @user.send(:encrypt_password)
        expect(@user.salt).to be_nil
        expect(@user.fugu).to be_nil
      end
    end
  end
end