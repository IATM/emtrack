module Emtrack
  class HistoryOfPresentIllness
    include Mongoid::Document
    include Mongoid::Timestamps

    #coomon options for arrays
    LATERALITY_OPTS = ['der','izq']
    BOOLEAN_OPTS = ['si','no']

    field :type, type: String, default: 'history of present illness'
    field :info_source, type: Array; INFO_SOURCE_OPTS = ['paciente', 'familiar o acudiente', 'historia clínica', 'llamada telefónica']
    field :start_date, type: Date
    field :episode_duration, type: Integer
    field :description
    field :difficulty_walking, type: Boolean
    field :motor_compromise_upper, type: Array #LATERALITY_OPTS
    field :motor_compromise_lower, type: Array #LATERALITY_OPTS
    field :sensory_compromise_upper, type: Array #LATERALITY_OPTS
    field :sensory_compromise_lower, type: Array #LATERALITY_OPTS
    field :sensory_compromise_trunk, type: Boolean
    field :sensory_compromise_lhermitte, type: Boolean
    field :bladder_intestinal_dysfunction, type: Boolean
    field :sexual_dysfunction, type: Boolean
    field :oculomotor_dysfunction, type: Boolean
    field :vestibulocochlear_dysfunction, type: Boolean
    field :language_swallowing_problems, type: Boolean
    field :optical_neuritis, type: Array #LATERALITY_OPTS
    field :cognitive_dysfunction, type: Boolean
    field :psychiatric_symptoms, type: Boolean
    field :fatigue, type: Boolean
    field :uhtoff, type: Boolean
    field :other
    field :episode_severity; EPISODE_SEVERITY_OPTS = ['leve', 'moderado', 'severo']
    field :recovery; RECOVERY_OPTS = ['desconocida', 'completa', 'incompleta']
    field :certainty; CERTAINTY_OPTS = ['desconocida', 'probable', 'posible', 'definitiva']
    field :associated_event, type: Array; ASSOCIATED_EVENT_OPTS = ['desconocido', 'ninguno', 'trauma', 'estrés', 'infección', 'vacunación', 'embarazo', 'otro']
    field :hospitalization, type: Boolean
    field :days_hospitalized, type: Integer
    field :steroid_treatment, type: Array; STEROID_TREATMENT_OPTS = ['VO', 'SC', 'IM', 'IV', 'otro']
    field :steroid_dose
    field :comments

    embedded_in :visit

    # Trim empty array values so they don't save to DB? UGGGLY pero funciona, until they fix this in Rails
    before_validation do |model|
      model.info_source.reject!(&:blank?) if model.info_source
      model.motor_compromise_upper.reject!(&:blank?) if model.motor_compromise_upper
      model.motor_compromise_lower.reject!(&:blank?) if model.motor_compromise_lower
      model.sensory_compromise_upper.reject!(&:blank?) if model.sensory_compromise_upper
      model.sensory_compromise_lower.reject!(&:blank?) if model.sensory_compromise_lower
      model.optical_neuritis.reject!(&:blank?) if model.optical_neuritis
      model.associated_event.reject!(&:blank?) if model.associated_event
      model.steroid_treatment.reject!(&:blank?) if model.steroid_treatment
    end

  end
end
