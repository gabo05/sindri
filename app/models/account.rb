class Account < ActiveRecord::Base
  belongs_to :email
  attr_accessible :passsword, :picture, :state
end
