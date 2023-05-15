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
end
