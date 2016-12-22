require 'rails_helper'

RSpec.describe Appointment, type: :model do
  let(:appointment) { Appointment.new }
  let(:doctor) { Doctor.new }
  let(:patient) { Patient.new }

  before do
    appointment.doctor = doctor
    appointment.patient = patient
  end

  describe "associations" do
    
    it "has one doctor" do
      expect(appointment.doctor).to eq doctor
    end

    it "has one patient" do
      expect(appointment.patient).to eq patient
    end
  end

  describe "date" do
    it "is valid with a date" do
      appointment.date = DateTime.now
      expect(appointment).to be_valid
    end

    it "is invalid without a date" do
      expect(appointment).to_not be_valid
    end
  end


end
