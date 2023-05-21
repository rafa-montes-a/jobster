# == Schema Information
#
# Table name: touchpoints
#
#  id          :integer          not null, primary key
#  date        :time
#  description :string
#  notes       :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  contact_id  :integer
#
class Touchpoint < ApplicationRecord
  #belongs_to(:contact, { :required => true, :class_name => "Contact", :foreign_key => "contact_id" })
  belongs_to :contact
end
