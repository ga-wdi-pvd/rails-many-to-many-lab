require 'rails_helper'

RSpec.describe Doctor, type: :model do
  describe "associations" do
    let(:doctor) { Doctor.new }
    let(:patient1) { Patient.new }
    let(:patient2) { Patient.new }

    before do
      doctor.patients + [patient1, patient2]
    end

    it "has many patients" do
      expect(doctor.patients.size).to eq 2
    end

  end
end
