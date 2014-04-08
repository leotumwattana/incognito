require 'spec_helper'

describe User do

  it { should have_many(:events) }

  before :each do
    @user = User.create(email: 'kulio@gmail.com', password: '1234', password_confirmation: '1234')
  end

  describe "email" do
    it "is valid with an email" do
      expect(@user).to be_valid
    end

    it "is invalid without an email" do
      @user.email = nil
      @user.save
      expect(@user).to have(1).error_on(:email)
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
        it "returns user"
      end

      context "when password is incorrect" do
        it "returns nil"
      end
    end

    describe "authenticate" do
      it "authenticates correctly"
    end
  end

  describe "reset password feature" do

    context "when password is blank" do
      it "is invalid"
    end

    context "when password is not blank" do

      context "when password matches confirmation" do
        it "fugu and salt changes"

        it "code and expires_at is nil"
      end

      context "when password does not match confirmation" do
        it "fugu and salt is unchanged"

        it "code and expires_at remains unchanged"
      end
    end
  end

  describe "Set random password if password is not provided" do
    context "when salt and fish exists" do
      it "salt and fish has value"
    end
  end

  describe "Password is encrypted before save" do
    context "when password is present" do
      it "salt and fish has value"

      context "encrypted password is not the same as plain" do
        it "password and fish should never be the same"
      end
    end

    context "password is not present" do
      it "salt and fish are nil"
    end
  end
end