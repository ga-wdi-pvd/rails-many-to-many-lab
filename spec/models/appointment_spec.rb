require 'rails_helper'

RSpec.describe Appointment, type: :model do
  let(:appointment){Appointment.new}

  describe "associations" do
    let(:patient) { Patient.new }
    let(:doctor) { Doctor.new }
    before do
      appointment.patient = patient
      appointment.doctor = doctor
    end
    it "belongs to patient" do
      expect(appointment.patient).to eq patient
    end
    it "belongs to doctor" do
      expect(appointment.doctor).to eq doctor
    end
  end
end
