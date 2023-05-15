# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  answer     :text
#  desc       :string
#  prompt     :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  job_id     :integer
#
class Question < ApplicationRecord
end
