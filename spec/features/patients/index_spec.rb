require 'rails_helper'

RSpec.describe 'patient index', type: :feature do
  let!(:denver_health) {Hospital.create!(name: "DenverHealth")}
  let!(:dr_quinn) {denver_health.doctors.create!(name: "Michaela Quinn", specialty: "Rural Health", university: "Boston")}
  let!(:dr_house) {denver_health.doctors.create!(name: "Gregory House", specialty: "ID", university: "Johns Hopkins")}
  let!(:dr_mccoy) {denver_health.doctors.create!(name: "Leonard Mccoy", specialty: "bones", university: "University")}

  let!(:katie) {Patient.create(name: "Katie L", age: 30)}
  let!(:brandon) {Patient.create(name: "Brandon J", age: 31)}
  let!(:amy) {Patient.create(name: "Amy S", age: 40)}
  let!(:penny) {Patient.create(name: "Penny", age: 8)}

  let!(:dr_quinn_amy) {DoctorPatient.create!(doctor_id: dr_quinn.id, patient_id: amy.id)}
  let!(:dr_quinn_katie) {DoctorPatient.create!(doctor_id: dr_quinn.id, patient_id: katie.id)}
  let!(:dr_mccoy_brandon) {DoctorPatient.create!(doctor_id: dr_mccoy.id, patient_id: brandon.id)}

  describe 'User Story 2 When I visit the patient index page ("/patients")' do
    it "I see the names of all adult patients (age is greater than 18) and I see the names are in ascending alphabetical order (A - Z)" do
      visit "/patients"
      save_and_open_page

      within("h3") do
        expect(page).to have_content("Adult Patient Names")
      end

      expect(page).to have_content("Amy S")
      expect(page).to have_content("Katie L")
      expect(page).to have_content("Brandon J")
      expect(page).to_not have_content("Penny")
      expect(amy.name).to appear_before(katie.name)
      expect(brandon.name).to appear_before(katie.name)
        
      end
    end
  end