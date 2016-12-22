require 'rails_helper'

RSpec.describe Doctor, type: :model do
  fixtures :appointments
  let(:doctor) { Doctor.create }

  describe "associations" do
    let(:patient1) { Patient.create }
    let(:patient2) { Patient.create }

    before do
      doctor.appointments.create(date: Time.zone.now, :patient_id => patient1.id)
      doctor.appointments.create(date: Time.zone.now, :patient_id => patient2.id)
    end

    it "has many patients" do
      expect(doctor.patients.size).to eq 2
      expect(doctor.patients.first).to eq patient1
    end

    it "has many appointments" do
      expect(doctor.appointments.size).to eq 2
    end

  end
end
