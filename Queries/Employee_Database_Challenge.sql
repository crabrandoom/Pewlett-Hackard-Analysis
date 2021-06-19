SELECT e.emp_no,
       e.first_name,
       e.last_name, 
       t.title,
       t.from_date,
       t.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;


SELECT DISTINCT ON (r.emp_no)
        r.emp_no,
        r.first_name,
        r.last_name,
        r.title
INTO unique_titles
FROM retirement_info as r
ORDER BY r.emp_no,  r.to_date DESC;


SELECT COUNT(u.titles)
INTO retiring_titles
FROM unique_titles as u
GROUP BY u.titles
ORDER BY COUNT(u.titles) DESC;



SELECT DISTINCT ON (e.emp_no)
        e.emp_no,
        e.first_name,
        e.last_name,
        e.birth_date,
        de.from_date,
        de.to_date,  
        t.title
INTO mentorship_eligibility
FROM dept_emp as de
INNER JOIN employees as e
ON (e.emp_no = de.emp_no)
INNER JOIN titles as t
ON (t.emp_no = e.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND de.to_date = ('9999-01-01');
ORDER BY e.emp_no;