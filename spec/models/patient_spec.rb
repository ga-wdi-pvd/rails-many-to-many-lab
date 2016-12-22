require 'rails_helper'

RSpec.describe Patient, type: :model do
  let(:patient) { Patient.create }
  describe "associations" do
    let!(:doctor1) { Doctor.create }
    let!(:doctor2) { Doctor.create }
    let(:appointment1) { Appointment.create(doctor_id: doctor1.id, date: Time.now) }
    let(:appointment2) { Appointment.create(doctor_id: doctor2.id, date: Time.now) } 
    let(:doctors){[doctor1, doctor2]}


    before do
      patient.appointments = [appointment1, appointment2]
    end

    it "has many appointments" do
      expect(patient.appointments.size).to eq 2
      expect(patient.appointments.first).to eq appointment1
    end

    it "has many doctors" do
      expect(patient.doctors.size).to eq doctors.size
    end

  end
end

