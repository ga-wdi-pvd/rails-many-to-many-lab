class AppointmentsController < ApplicationController
  before_action :set_appointment, except: [:index, :create, :new]

  def index
    @appointments = Appointment.all
  end

  def show
  end

  def create
   @appointment = Appointment.new(appointment_params)
   if @appointment.save

    flash[:notice] = "Success!"
    redirect_to @appointment
  else
    flash[:error] = "Error!"
    render :new
  end


  end

  def new
    @appointment = Appointment.new
  end

  def destroy
    @appointment.destroy
    redirect_to appointments_path
  end

  def edit
  end

  def update
  end

  private

  def set_appointment
    @appointment = Appointment.find(params[:id])
  end

  def appointment_params
    params.require(:appointment).permit(:doctor_id, :patient_id, :date)
  end

end
