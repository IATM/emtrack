class MentalExam
  include Mongoid::Document
  include Mongoid::Timestamps

  ALTERATION_OPTS = ['normal', 'alterada']

  field :conscience, type: Array # ALTERATION_OPTS
  field :attention, type: Array # ALTERATION_OPTS
  field :memory, type: Array # ALTERATION_OPTS
  field :language, type: Array # ALTERATION_OPTS
  field :language_alteration, type: Array; LANGUAGE_ALTERATION_OPTS = ['afasia sensitiva', 'afasia motora', 'anomia']

  embedded_in :visit

  # Trim empty array values so they don't save to DB? UGGGLY pero funciona, until they fix this in Rails
  before_validation do |model|
    model.conscience.reject!(&:blank?) if model.conscience
    model.attention.reject!(&:blank?) if model.attention
    model.memory.reject!(&:blank?) if model.memory
    model.language.reject!(&:blank?) if model.language
    model.language_alteration.reject!(&:blank?) if model.language_alteration
  end

end
