CREATE TABLE Members (
    member_id SERIAL PRIMARY KEY,
    m_name VARCHAR(54) NOT NULL,
    m_age INT NOT NULL,
    m_contact VARCHAR(20),
    m_email VARCHAR(100),
    sex VARCHAR(10) CHECK (sex IN ('male', 'm', 'female', 'f'))
);

CREATE TABLE Memberships (
    membership_id SERIAL PRIMARY KEY,
    member_id INT REFERENCES Members(member_id) ON DELETE CASCADE,
    plan_name VARCHAR(30) NOT NULL,
    duration_months INT NOT NULL,
    price NUMERIC(10,2) NOT NULL,
    start_date DATE NOT NULL
);

CREATE TABLE Trainers (
    trainer_id SERIAL PRIMARY KEY,
    t_name VARCHAR(54) NOT NULL,
    specialty VARCHAR(50),
    experience_years INT NOT NULL,
    salary NUMERIC(10,2)
);