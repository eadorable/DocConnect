class MedicalHistoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @medical_histories = MedicalHistory.all
  end

  def show
    @medical_history = MedicalHistory.find(params[:id])
  end

  def new
    @medical_history = MedicalHistory.new
    @patient = Patient.find(params[:patient_id])
  end

  def edit
    @medical_history = MedicalHistory.find(params[:id])
    @patient = Patient.find(params[:patient_id])

  end

  def create
    @medical_history = MedicalHistory.new(medical_history_params)
    @patient = Patient.find(params[:patient_id])
    @medical_history.patient = @patient

    if @medical_history.save
      redirect_to today_appointments_path
    else
      render 'new'
    end
  end

  def update
    @medical_history = MedicalHistory.find(params[:id])
    @patient = Patient.find(params[:patient_id])
    @medical_history.patient = @patient
    if @medical_history.update(medical_history_params)
      redirect_to patient_path(@patient)
    else
      render 'edit'
    end
  end

  # def destroy
  #   @medical_history = MedicalHistory.find(params[:id])
  #   @medical_history.destroy

  #   redirect_to medical_histories_path
  # end

  private
  def medical_history_params
    params.require(:medical_history).permit(:patient_id, :history_details)
  end
end
