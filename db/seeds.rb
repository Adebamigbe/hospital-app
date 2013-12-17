# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!({first_name: :Admin, last_name: :Administrator, email: "admin@admin.com", password: 1234, role: "admin"})
User.create!({first_name: :Bob, last_name: :Bobby, email: "bob@bob.com", password: 1234})

["Internal Medicine", "Imaging and X-ray Centre", "Specialist Surgery", "Health Screening", "Obstetrics and Gynaecology", "Paediatrics", "General Surgery", "Dental Surgery", "Intensive Coronary Care", "Modular Operating Theatre", "Physiotherapy", " Eye", "Pharmacy", "Accident and emergency (A&E)"].each do |category_name|
  category = SpecialisationCategory.new
  category.name = category_name
  category.save
end

{
  1 => ["Cardiac Centre", "Nephrology", "Endocrinology", "Diabetes Mellitus", "Gastro-enterology", "Neurology", "Psychiatry"],
  2 => ["MRI Scanning", "CT Scanning", "Plain X-rays", "Barium Examinations", "IVU’s", "Cystograms", "Mammography", "Ultrasound Scans"],
  3 => ["ENT Surgery", "Eye Clinic"],
  4 => ["Premiere", "Standard"],
  5 => ["Antenatal clinic", "Family Planning Clinic", "Fertility Clinic", "Routine Gynaecology Clinic", "Laparoscopy"],
  6 => ["Out-patient Clinic", "Emergencies in Children", "Immunisation", "Paediatric", "Intensive Care", "Neonatal Intensive Care", "virology", "diabetics", "hepatitis", "malaria", "cholera", "jaundice", "measles", "rashes", "chickenpox", "smallpox"],
  7 => ["Breast Surgery", "Orthopaedics", "Trauma", "Urology"],
  8 => ["Oral and maxillofacial surgery", "oral surgery", "orthodontics", "paediatric dentistry", "endodontics", "periodontics", "prosthodontics", "oral pathology", "oral microbiology", "dental maxillofacial radiology"],
  9 => ["adult beds", "Paediatric Intensive Care", "Neonatal Intensive Care"],
  10 => ["Operating Rooms", "Delivery Suites", "Endoscopy Suite", "Recovery Rooms"],
  11 => ["neurology", "orthopaedics", "trauma", "respiratory", "neuromuscular", "musculoskeletal"],
  12 => ["retina", "glaucoma unit", "opthalmoogy", "anterior segment unit", "optometry", "optical unit"],
  13 => ["ambulatory pharmacists", "nuclear pharmacy", "oncology", "pharmacotherapy", "psychiatric pharmacy", "nutrition support", "hiv", "renal", "chronic diseases", "diabetes", "asthma", "drug pharmacy"],
  14 => ["injury area", "resuscitation", "cardiac", "invasive monitoring", "ambulance", "snake bites" ]

}.each do |specialisation_category_id, specialisation_names|
  specialisation_names.each do |specialisation_name|
    specialisation = Specialisation.new
    specialisation.name = specialisation_name
    specialisation.specialisation_category_id = specialisation_category_id
    specialisation.save
  end
end