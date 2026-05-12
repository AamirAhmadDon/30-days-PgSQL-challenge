SELECT * FROM Members WHERE m_age <= 22 AND sex IN ('m', 'male');
SELECT * FROM Trainers
SELECT * FROM Memberships

--RANK() and DENSE_RANK() functions
SELECT m.m_name, ms.price, RANK() OVER (ORDER BY ms.price DESC) AS price_rank FROM Members m JOIN Memberships ms ON m.member_id = ms.member_id;
--LAG() and LEAD() functions

--LAG and LEAD functions
SELECT t.t_name, salary, LAG(salary) OVER (ORDER BY salary) AS previous_salary, LEAD(salary) OVER (ORDER BY salary) AS next_salary FROM Trainers t;
SELECT m.m_name, m.m_age, LEAD(m.m_age) OVER (ORDER by m.m_age) AS next_age, LEAD (m.m_age) OVER (ORDER BY m.m_age DESC) AS previous_age FROM Members m;

--sum() and over()
SELECT price , SUM(price) OVER (ORDER BY price) AS Consecutie_price FROM Memberships; 

--moving average
SELECT member_id, price, AVG(price) OVER (ORDER by member_id ROWS between 2 PRECEDING AND CURRENT ROW) AS moving_average FROM Memberships;
SELECT member_id, price, AVG(price) OVER (ORDER by member_id ROWS between 3 PRECEDING AND 2 FOLLOWING) AS moving_average FROM Memberships;
SELECT member_id, plan_name, price, AVG(price) OVER (PARTITION BY plan_name) AS average_price_per_plan FROM Memberships;
SELECT member_id, plan_name, price, AVG(price) OVER (PARTITION BY plan_name) AS average_price_per_plan FROM Memberships;

--Views
CREATE VIEW speciality AS SELECT t_name, salary FROM Trainers WHERE specialty = 'Cardio & Fat Loss';
CREATE VIEW m_age AS SELECT member_id, m_name FROM Members WHERE m_age >= 18 AND m_age <= 25;

--Procdeure making
CREATE PROCEDURE get_membership_details(p_member_id INT) LANGUAGE SQL AS $$ INSERT INTO Memberships(member_id, plan_name, time_durations, price, start_date) VALUES (p_member_id, 'Standard', 3, 4000.00, '2026-02-01'); $$;
CALL get_membership_details(7); --adds membeship plans for member with id 7
CREATE PROCEDURE increaseSalary() LANGUAGE plpgql AS $$ BEGIN UPDATE Trainers SET salary = salary * 1.10; end; $$; CALL increaseSalary(); --increases the salary for all the trainers
CREATE PROCEDURE discountMember(member_id INT, discount NUMERIC) LANGUAGE plpgsql AS $$ BEGIN UPDATE Memberships SET discount = price * (discount/100) WHERE member_id = member_id AND m_age >=30 AND m_age<=40; END $$; CALL discountMember(); 

--indexex/indexing
CREATE UNIQUE INDEX idx_m_name on Members(m_name);
CREATE index idx_trainer_name on Trainers(t_name);