class PatientsController < ApplicationController
  before_action :authenticate_user!

  def index
    @patients = Patient.all.where(user_id: current_user.id)
  end

  def new
    @patient = Patient.new

  end

  def create
    existing_patient = Patient.find_by("TRIM(UPPER(name)) ILIKE ?", params[:patient][:name].squish.upcase)

    if existing_patient
      redirect_to patients_path, notice: 'Patient already exists'
    else
      @patient = Patient.new(patient_params)
      @patient.user = current_user

      if @patient.save
        redirect_to root_path, notice: 'Patient created successfully'
      else
        render :new, notice: 'Patient could not be created, check the form for errors'
      end
    end
  end

  def show
    @patient = Patient.find(params[:id])
    @medical_history = MedicalHistory.new
    @medical_histories = @patient.medical_histories
  end

  def edit
    @patient = Patient.find(params[:id])

  end

  def update
    @patient = Patient.find(params[:id])

    if @patient.update(patient_params)
      redirect_to patients_path, notice: 'Patient updated successfully'
    else
      render :edit
    end
  end

  def destroy
    @patient = Patient.find(params[:id])
    if @patient.destroy
      redirect_to patients_path, notice: 'Patient deleted successfully'
    else
      redirect_to patients_path, notice: 'Patient could not be deleted'
    end
  end

  private

  def patient_params
    params.require(:patient).permit(:name, :address, :contact_number, :email, :date_of_birth, :gender, :marital_status, :age, :weight, :height, :user_id)
  end

end
