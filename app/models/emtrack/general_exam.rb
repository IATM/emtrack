class GeneralExam
  include Mongoid::Document
  include Mongoid::Timestamps

  field :systolic
  field :diastolic
  field :heart_rate
  field :weight
  field :height
  field :comments

  embedded_in :visit

end
