class DoctorsController < ApplicationController

  def index
    @doctors = Doctor.all
  end

  # def show
  #   @doctor = Doctor.find(params[:id])
  #   @appointments = @doctor.appointments
  # end

  def new
    @doctor = Doctor.new
  end

  def create
    existing_doctor = Doctor.find_by("TRIM(UPPER(name)) ILIKE ?", params[:doctor][:name].squish.upcase)

    if existing_doctor
      redirect_to doctors_path, notice: 'Doctor already exists'
    else

      @doctor = Doctor.new(doctor_params)

      if @doctor.save
        redirect_to root_path, notice: 'Doctor created successfully'
      else
        render :new
      end
    end
  end

  def edit
    @doctor = Doctor.find(params[:id])
  end

  def update
    @doctor = Doctor.find(params[:id])

    if @doctor.update(doctor_params)
      redirect_to doctors_path(@doctor)
    else
      render :edit
    end
  end

  def destroy
    @doctor = Doctor.find(params[:id])
    if @doctor.destroy
      redirect_to doctors_path, notice: 'Doctor has been deleted.'
    else
      redirect_to doctors_path, notice: 'Doctor could not be deleted.'
    end
  end

  private

  def doctor_params
    params.require(:doctor).permit(:name, :address, :contact_number, :email, :specialty)
  end
end
