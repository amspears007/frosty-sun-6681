require "rails_helper"

RSpec.describe 'Doctor Show Page', type: :feature do
  let!(:denver_health) {Hospital.create!(name: "DenverHealth")}
  let!(:dr_quinn) {denver_health.doctors.create!(name: "Michaela Quinn", specialty: "rural health", university: "Boston")}
  let!(:dr_house) {denver_health.doctors.create!(name: "Gregory House", specialty: "ID", university: "Johns Hopkins")}
  let!(:dr_mccoy) {denver_health.doctors.create!(name: "Leonard Mccoy", specialty: "bones", university: "University")}

  let!(:amy) {Patient.create(name: "Amy S", age: 40)}
  let!(:brandon) {Patient.create(name: "Brandon J", age: 31)}
  let!(:katie) {Patient.create(name: "Katie L", age: 30)}

  let!(:dr_quinn_amy) {DoctorPatient.create!(doctor_id: dr_quinn.id, patient_id: amy.id)}
  let!(:dr_quinn_katie) {DoctorPatient.create!(doctor_id: dr_quinn.id, patient_id: katie.id)}
  let!(:dr_mccoy_brandon) {DoctorPatient.create!(doctor_id: dr_mccoy.id, patient_id: brandon.id)}

  describe "US 1 when I visit /doctors/:id" do
  it " I see all of that doctor's information including:name, specialty university where they got their doctorate" do
    visit "/doctors/#{dr_quinn.id}"

    within(".project_info") do
      expect(page).to have_content("Name: Michaela Quinn")
      expect(page).to have_content("Specialty: rural health")
      expect(page).to have_content("University: Boston")
      expect(page).to_not have_content("Name:Gregory House")
        end
      end
    end

  end