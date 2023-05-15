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
  
  validates(:job_id, { :presence => true })
  belongs_to(:job, { :required => true, :class_name => "Job", :foreign_key => "job_id" })

end
