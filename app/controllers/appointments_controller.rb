class AppointmentsController < ApplicationController
  before_action :authenticate_user!

  def index
    # @appointments = current_user.appointments_as_secretary.includes(:patient)
    # @appointments = current_user.appointments_as_secretary.includes(:patient).where(appointment_date: Date.today.beginning_of_day..Date.today.end_of_day)
    @appointments = Appointment.all.where(appointment_date: Date.today.beginning_of_day..Date.today.end_of_day)
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
  end

  def create
    @appointment = Appointment.new(appointment_params.merge(doctor_id: current_user.id))
    if @appointment.save
      redirect_to appointments_path, notice: 'Appointment created successfully'
    else
      render :new
    end
  end

  def edit
    @appointment = current_user.appointments_as_doctor.find(params[:id])
  end

  def update
    @appointment = current_user.appointments_as_doctor.find(params[:id])
    if @appointment.update(appointment_params)
      redirect_to appointments_path, notice: 'Appointment updated successfully'
    else
      render :edit
    end
  end

  private

  def appointment_params
    params.require(:appointment).permit(:appointment_date, :status, :patient_id)
  end

  # Add other actions as needed (e.g., new, create, edit, update, destroy)
end
