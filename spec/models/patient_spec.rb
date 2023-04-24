require 'rails_helper'

RSpec.describe Patient do
  let!(:denver_health) {Hospital.create!(name: "DenverHealth")}
  let!(:dr_quinn) {denver_health.doctors.create!(name: "Michaela Quinn", specialty: "Rural Health", university: "Boston")}
  let!(:dr_house) {denver_health.doctors.create!(name: "Gregory House", specialty: "ID", university: "Johns Hopkins")}
  let!(:dr_mccoy) {denver_health.doctors.create!(name: "Leonard Mccoy", specialty: "bones", university: "University")}

  let!(:katie) {Patient.create(name: "Katie L", age: 30)}
  let!(:brandon) {Patient.create(name: "Brandon J", age: 31)}
  let!(:amy) {Patient.create(name: "Amy S", age: 40)}

  let!(:dr_quinn_amy) {DoctorPatient.create!(doctor_id: dr_quinn.id, patient_id: amy.id)}
  let!(:dr_quinn_katie) {DoctorPatient.create!(doctor_id: dr_quinn.id, patient_id: katie.id)}
  let!(:dr_mccoy_brandon) {DoctorPatient.create!(doctor_id: dr_mccoy.id, patient_id: brandon.id)}

  it {should have_many :doctor_patients}
  it {should have_many(:doctors).through(:doctor_patients)}
end

describe 'get names of all patients with age > 18' do
  expect(Patient.adult).to eq([katie, brandon, amy])
end