module Emtrack
  class HistoryOfPresentIllnessController < ApplicationController
    before_action :load_patient
    before_action :load_visit
    before_action :set_history_of_present_illness, only: [:show, :edit, :update]

    def show
    end

    def edit
    end

    def update
      respond_to do |format|
        if @history_of_present_illness.update_attributes(history_of_present_illness_params)
          format.html { redirect_to [@patient, @visit, @history_of_present_illness], notice: 'Clinical history was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: 'edit' }
          format.json { render json: @history_of_present_illness.errors, status: :unprocessable_entity }
        end
      end
    end

    private
      def set_history_of_present_illness
        @history_of_present_illness = @visit.history_of_present_illness
      end

      def load_patient
        @patient = Patient.find(params[:patient_id])
      end

      def load_visit
        @visit = @patient.visits.find(params[:visit_id])
      end

      def history_of_present_illness_params
        params.require(:history_of_present_illness)
              .permit(
                      {info_source: []},
                      :start_date,
                      :type,
                      :episode_duration,
                      :description,
                      :difficulty_walking,
                      {motor_compromise_upper: []},
                      {motor_compromise_lower: []},
                      {sensory_compromise_upper: []},
                      {sensory_compromise_lower: []},
                      :sensory_compromise_trunk,
                      :sensory_compromise_lhermitte,
                      :bladder_intestinal_dysfunction,
                      :sexual_dysfunction,
                      :oculomotor_dysfunction,
                      :vestibulocochlear_dysfunction,
                      :language_swallowing_problems,
                      {optical_neuritis: []},
                      :cognitive_dysfunction,
                      :psychiatric_symptoms,
                      :fatigue,
                      :uhtoff,
                      :other,
                      :episode_severity,
                      :recovery,
                      :certainty,
                      {associated_event: []},
                      :hospitalization,
                      :days_hospitalized,
                      {steroid_treatment: []},
                      :steroid_dose,
                      :comments
                      )
      end
  end
end
