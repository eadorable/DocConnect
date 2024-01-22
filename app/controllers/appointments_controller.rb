class AppointmentsController < ApplicationController
  before_action :authenticate_user!

  def index
    # @appointments = current_user.appointments_as_secretary.includes(:patient)
    # @appointments = current_user.appointments_as_secretary.includes(:patient).where(appointment_date: Date.today.beginning_of_day..Date.today.end_of_day)
    @appointments = Appointment.all.where(appointment_date: Date.today.beginning_of_day..Date.today.end_of_day)
  end

  def show
    # @appointment = current_user.appointments_as_doctor.find(params[:id])
    @appointment = Appointment.find(params[:id])
    @medical_histories = @appointment.patient.medical_history
  end

  # Add other actions as needed (e.g., new, create, edit, update, destroy)
end
