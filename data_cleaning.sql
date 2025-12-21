USE hospital;

-- REMOVING leading spaces from all VARCHAR columns

UPDATE appointments
SET	patient_id = TRIM(patient_id),
    doctor_id = TRIM(doctor_id),
    reason_for_visit = TRIM(reason_for_visit),
    status = TRIM(status);

UPDATE billings
SET	patient_id = TRIM(patient_id),
    treatment_id = TRIM(treatment_id),
    payment_method = TRIM(payment_method),
    payment_status = TRIM(payment_status);

UPDATE doctors
SET	first_name = TRIM(first_name),
    last_name = TRIM(last_name),
    specialization = TRIM(specialization),
    phone_number = TRIM(phone_number),
    hospital_branch = TRIM(hospital_branch),
    email = TRIM(email);

UPDATE patients
SET first_name = TRIM(first_name),
	last_name = TRIM(last_name),
	gender = TRIM(gender),
    contact_number = TRIM(contact_number),
    address = TRIM(address),
    insurance_provider = TRIM(insurance_provider),
    insurance_number = TRIM(insurance_number),
    email = TRIM(email);

UPDATE treatments
SET	appointment_id = TRIM(appointment_id),
    treatment_type = TRIM(treatment_type),
    description = TRIM(description);


-- STANDARDIZE TEXT FORMATS

UPDATE appointments
SET status = CONCAT(UCASE(LEFT(status,1)), LCASE(SUBSTRING(status,2)))
WHERE status IS NOT NULL;

UPDATE billings
SET payment_status = CONCAT(UCASE(LEFT(payment_status,1)), LCASE(SUBSTRING(payment_method,2)))
WHERE payment_method IS NOT NULL;

UPDATE patients
SET gender = UPPER(gender)
WHERE gender IS NOT NULL;

