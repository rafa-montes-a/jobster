# == Schema Information
#
# Table name: jobs
#
#  id               :integer          not null, primary key
#  city             :string
#  country          :string
#  firm_name        :string
#  follow_up_link   :string
#  job_desc         :text
#  job_desc_link    :string
#  job_number       :string
#  role             :string
#  state            :string
#  status           :string
#  summary_job_desc :text
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  firm_id          :integer
#  user_id          :integer
#
class Job < ApplicationRecord
  
  validates(:user_id, { :presence => true })
  validates(:role, { :presence => true })
  validates(:firm_name, { :presence => true })

  belongs_to(:user, { :required => true, :class_name => "User", :foreign_key => "user_id" })
  has_many(:questions, { :class_name => "Question", :foreign_key => "job_id", :dependent => :destroy })
  #belongs_to(:firm, { :required => true, :class_name => "Firm", :foreign_key => "firm_id" })
  belongs_to :firm

end
