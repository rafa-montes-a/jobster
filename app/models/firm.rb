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
end
