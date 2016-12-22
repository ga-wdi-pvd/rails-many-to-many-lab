class AppointmentsController < ApplicationController
  before_action :load_appointment, except: [:index, :new, :create]

  def index
    @appointments = Appointment.all
  end

  def new
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.new(appointment_params)

    respond_to do |format|
      if @appointment.save
        flash[:notice] = "Success!"
        redirect_to appointments_path
      else
        flash[:error] = "Error!"
        render new_appointment_path
      end
      format.html
    end
  end

  def show
  end

  def update
    @appointment.update(appointment_params)
    redirect_to appointment_path(@appointment)
  end

  def destroy
    @appointment.destroy
    redirect_to appointments_path
  end

  private

  def load_appointment
    @appointment = Appointment.find(params[:id])
  end

  def appointment_params
    params.require(:appointment).permit(:doctor_id, :patient_id, :date)
  end

end
