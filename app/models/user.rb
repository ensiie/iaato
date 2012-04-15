class User
  include Mongoid::Document

  devise :database_authenticatable, :recoverable, :token_authenticatable
end
