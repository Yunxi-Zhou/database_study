-- Exercise: Enrollment interval

-- ▶ Xnot-first := 𝜎E1.student=E2.student∧E1.year>E2.year(𝜌E1(enroll_in) × 𝜌E2(enroll_in));
-- ▶ Yfirst := 𝜋student,year(enroll_in) \ 𝜋E1.student,E1.year(Xnot-first).
-- Ylast The last year they enrolled: swap E1.year > E2.year for E1.year < E2.year.
-- 𝜌R(student,first_year,last_year) (𝜋F .student,F .year,L.year(𝜎F .student=L.student(𝜌F (Yfirst) × 𝜌L (Ylast))))

-- 1. A basic query in relational algebra
-- 𝜋title (𝜎S.sid=E.sid∧E.cid=C.cid∧S.name=‘Dafni′ (𝜌S (students) × 𝜌E (enroll_in) × 𝜌C (courses)))
SELECT c.title
FROM students s, enroll_in e, course c
WHERE s.sid = e.sid AND e.cid = c.cid AND s.name = 'Dafni';