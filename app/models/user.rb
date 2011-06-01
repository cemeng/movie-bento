require 'digest/sha2'

class User < ActiveRecord::Base

  validates :name, :presence => true, :uniqueness => true
  validates :password, :confirmation => true

  # need to read more about accessor and reader
  attr_accessor :password_confirmation
  attr_reader   :password

  validate :password_must_be_present


  # password is a virtual attribute
  def password=(password)
    @password = password

    if password.present?
      generate_salt
      self.hashed_password=self.class.encrypt_password(password,salt)
      #what's wrong with the code below? Is it because it is private method we need the class?
      #self.hashed_password=self.encrypt_password(password,salt)
    end
  end


  # Class method - can be called without authenticating
  # or static method - java speak
  def User.encrypt_password(password,salt)
    Digest::SHA2.hexdigest( password + "wiggle" + salt )
  end

  def User.authenticate( name, password )

    user = User.find_by_name( name )
    if ( user )
      if ( user.hashed_password == encrypt_password( password, user.salt ) )
        user
      end
    end

  end

  #############################################

  private
    def password_must_be_present
      errors.add( :password, "Missing Password" ) unless hashed_password.present?
    end

    def generate_salt
      self.salt = self.object_id.to_s + rand.to_s
    end


end
