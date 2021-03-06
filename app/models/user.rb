class User < ActiveRecord::Base
  attr_accessor :password, :password_confirmation
  before_save {  |user| user.email = email.downcase }
  before_save :encrypt_password
  before_create :create_auth_key

  validates :password, presence: true, length: { minimum: 6 }, confirmation: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates(:email, presence: true, format: { with: VALID_EMAIL_REGEX},
            uniqueness: { case_sensitive: false } )

  has_many :relationships
  has_many :students, :through => :relationships
  has_many :mentorships, :class_name => "Relationship", :foreign_key => "student_id"
  has_many :mentors, :through => :mentorships, :source => :user
  
  has_many :contracts
  has_many :activities
  has_many :feed_items

  def activities
    return Activity.where("contract_id IN (?)", contracts.ids)
  end


  def User.hash(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

  def self.authenticate(email, password)
    user = User.find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

  private
  
  def create_auth_key
    begin
      self.auth_key = SecureRandom.hex
    end while self.class.exists?(auth_key: auth_key)
  end
end
