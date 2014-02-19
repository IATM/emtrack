module Emtrack
  class ClinicalHistoryController < ApplicationController
    before_action :load_patient
    before_action :set_clinical_history, only: [:show, :edit, :update]

    def show
    end

    def edit
    end

    def update
      respond_to do |format|
        if @clinical_history.update_attributes(clinical_history_params)
          format.html { redirect_to [@patient, @clinical_history], notice: 'Clinical history was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: 'edit' }
          format.json { render json: @clinical_history.errors, status: :unprocessable_entity }
        end
      end
    end

    private
      def set_clinical_history
        @clinical_history = @patient.clinical_history
      end

      def clinical_history_params
        params.require(:clinical_history)
              .permit(
                      {pathologic: []},
                      {autoimmune: []},
                      {neurologic: []},
                      {psychiatric: []},
                      :surgical,
                      {ob_gyn: []},
                      :birth_control,
                      {toxic: []},
                      :addictions,
                      :allergic,
                      :recent_vaccines,
                      :trauma,
                      :comments
                      )
      end

      def load_patient
        @patient = Patient.find(params[:patient_id])
      end
  end
end
