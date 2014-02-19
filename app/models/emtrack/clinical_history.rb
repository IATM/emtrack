class ClinicalHistory
  include Mongoid::Document
  include Mongoid::Timestamps

  field :pathologic, type: Array; PATHOLOGIC_OPTS = ['diabetes', 'dislipidemia', 'enfermedad cardiaca', 'enfermedad tiroidea', 'hipertensión']
  field :autoimmune, type: Array; AUTOIMMUNE_OPTS = ['artritis reumatoidea', 'diabetes tipo 1', 'enfermedad inflamatoria intestinal', 'escleroderma', 'LES']
  field :neurologic, type: Array; NEUROLOGIC_OPTS = ['ACV', 'ELA', 'epilepsia', 'miastenia gravis', 'migraña', 'síndrome de Guillain Barré']
  field :psychiatric, type: Array; PSYCHIATRIC_OPTS = ['depresión', 'TAB', 'TAG']
  field :surgical
  field :ob_gyn, type: Array; OB_GYN_OPTS = ['G','P','C','A','E','V']
  field :birth_control
  field :toxic, type: Array; TOXIC_OPTS = ['cigarrillo', 'alcohol', 'otras sustancias']
  field :addictions
  field :allergic
  field :recent_vaccines
  field :trauma
  field :comments

  embedded_in :patient

  # Trim empty array values so they don't save to DB? UGGGLY pero funciona, until they fix this in Rails
  before_validation do |model|
    model.pathologic.reject!(&:blank?) if model.pathologic
    model.autoimmune.reject!(&:blank?) if model.pathologic
    model.neurologic.reject!(&:blank?) if model.pathologic
    model.psychiatric.reject!(&:blank?) if model.pathologic
    model.ob_gyn.reject!(&:blank?) if model.pathologic
    model.toxic.reject!(&:blank?) if model.pathologic
  end

end
