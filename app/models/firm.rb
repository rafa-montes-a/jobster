# == Schema Information
#
# Table name: firms
#
#  id         :integer          not null, primary key
#  firm_name  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
class Firm < ApplicationRecord
  
  validates(:user_id, { :presence => true })
  validates(:firm_name, { :presence => true })
  validates(:firm_name, { :uniqueness => { :scope => ["user_id"] } })

  belongs_to(:user, { :required => true, :class_name => "User", :foreign_key => "user_id" })
  has_many(:jobs, { :class_name => "Job", :foreign_key => "firm_id", :dependent => :nullify })
  has_many(:contacts, { :class_name => "Contact", :foreign_key => "firm_id", :dependent => :nullify })

end
