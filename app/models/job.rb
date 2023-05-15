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
end
