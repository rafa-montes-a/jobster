# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string
#  first_name      :string
#  last_name       :string
#  password_digest :string
#  resume          :text
#  skills          :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  validates(:last_name, { :presence => true })
  validates(:first_name, { :presence => true })

  has_secure_password

  has_many(:jobs, { :class_name => "Job", :foreign_key => "user_id", :dependent => :nullify })
  has_many(:firms, { :class_name => "Firm", :foreign_key => "user_id", :dependent => :nullify })
  has_many(:contacts, { :class_name => "Contact", :foreign_key => "user_id", :dependent => :nullify })

end
