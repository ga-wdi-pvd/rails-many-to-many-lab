require 'rails_helper'

RSpec.describe Appointment, type: :model do
  fixtures :appointments
  fixtures :doctors
  fixtures :patients

  let(:appointment){appointments(:valid)}

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

  describe "#appointment" do
    #let(:doctor) { Doctor.create }
    #let(:patient) { Patient.create }
    let(:appointment) { Appointment.new } #Appointment.new(doctor: doctor, patient: patient) }

    before do
      appointment.doctor = doctors(:scully)
      appointment.patient = patients(:fox)
    end
    it "requires a datetime to be present" do
      expect(appointment).to_not be_valid
      appointment.date = DateTime.now + 24.hours
      expect(appointment).to be_valid
    end

    it "has a date that is a datetime" do
      appointment.date = Time.zone.now
      expect(appointment.date.day.is_a? Integer).to be true
      expect(appointment.date.hour.is_a? Integer).to be true
    end
  end
end
