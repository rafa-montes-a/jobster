# == Schema Information
#
# Table name: contacts
#
#  id         :integer          not null, primary key
#  email      :string
#  firm_name  :string
#  first_name :string
#  last_name  :string
#  role       :string
#  status     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  firm_id    :integer
#  user_id    :integer
#
class Contact < ApplicationRecord
  
  validates(:user_id, { :presence => true })
  validates(:first_name, { :presence => true })
  validates(:firm_name, { :presence => true })

  belongs_to(:user, { :required => true, :class_name => "User", :foreign_key => "user_id" })
  belongs_to(:firm, { :class_name => "Firm", :foreign_key => "firm_id" })
  has_many(:touchpoints, { :class_name => "Touchpoint", :foreign_key => "contact_id", :dependent => :nullify })

end
