class AppointmentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @appointments_today = Appointment.all.where(appointment_date: Date.today.beginning_of_day..Date.today.end_of_day)
    # This is for the calendar
    # @ppointments_date = Time.now.beginning_of_month.beginning_of_week..Time.now.end_of_month.end_of_week
  end

  def show
    # @appointment = current_user.appointments_as_doctor.find(params[:id])
    @appointment = Appointment.find(params[:id])
    @medical_histories = @appointment.patient.medical_history
  end

  def new
    @appointment = Appointment.new

    # for the dropdown, f.collection_select(:patient_id, Patient.all, :id, :name)
    @doctors = Doctor.all
    @patients = Patient.all
  end

  def create
    @appointment = Appointment.new(appointment_params)

    if @appointment.save
      redirect_to appointments_path, notice: 'Appointment was successfully created.'
    else

      # for the dropdown, f.collection_select(:patient_id, Patient.all, :id, :name)
      @doctors = Doctor.all
      @patients = Patient.all
      render :new
    end
  end

  def edit
    @appointment = Appointment.find(params[:id])

    # for the dropdown, f.collection_select(:patient_id, Patient.all, :id, :name)
    @doctors = Doctor.all
    @patients = Patient.all
  end

  def update
    @appointment = Appointment.find(params[:id])

    if @appointment.update(appointment_params)
      redirect_to appointments_path, notice: 'Appointment was successfully updated.'
    else

      # for the dropdown, f.collection_select(:patient_id, Patient.all, :id, :name)
      @doctors = Doctor.all
      @patients = Patient.all
      render :edit
    end
  end

  def destroy
    @appointment = Appointment.find(params[:id])
    if @appointment.destroy
      redirect_to appointments_path, notice: 'Appointment was successfully deleted.'
    else
      redirect_to appointments_path, notice: 'Appointment was not deleted.'
    end
  end


  private

  def appointment_params
    params.require(:appointment).permit(:appointment_date, :status, :patient_id, :doctor_id)
  end

end
