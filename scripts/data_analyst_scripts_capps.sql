-- 1. How many rows are in the data_analyst_jobs table?

SELECT COUNT (*)
FROM data_analyst_jobs;

--Answer: 1793

-- 2. Write a query to look at just the first 10 rows. What company is associated with the job posting on the 10t row?

SELECT *
FROM data_analyst_jobs
LIMIT 10;


--Answer: ExxonMobil

-- 3. How many postings are in Tennessee? How many are there in either Tennessee or Kentucky?

SELECT location
FROM data_analyst_jobs
WHERE location = 'TN' OR location = 'KY';

--Answer: 21 postings in Tennessee and 27 postings in Tennessee or Kentucky

-- 4. How many postings in Tennessee have a star rating above 4?

SELECT location, star_rating
FROM data_analyst_jobs
WHERE location = 'TN' AND star_rating > 4;

--Answer: 3

-- 5. How many postings in the dataset have a review count between 500 and 1000?

SELECT review_count
FROM data_analyst_jobs
WHERE review_count BETWEEN 500 AND 1000;

--Answer: 151

-- 6. Show the average star rating for companies in each state. The output should show the state as `state` and the average rating for the state as `avg_rating`. Which state shows the highest average rating?

SELECT location AS state, AVG(star_rating) AS avg_rating
FROM data_analyst_jobs
GROUP BY location
ORDER BY avg_rating DESC;

--Answer: Nebraska

-- 7. Select unique job titles from the data_analyst_jobs table. How many are there?

SELECT COUNT(DISTINCT title)
FROM data_analyst_jobs;

--Answer: 881

-- 8. How many unique job titles are there for California companies?

SELECT COUNT(DISTINCT title)
FROM data_analyst_jobs
WHERE location = 'CA';

--Answer: 230

-- 9. Find the name of each company and its average star rating for all companies that have more than 5000 reviews across all locations. How many companies are there with more that 5000 reviews across all locations?

SELECT company, AVG(star_rating) 
FROM data_analyst_jobs
WHERE review_count > 5000 
AND company IS NOT NULL
GROUP BY company;

--Answer: 40

-- 10. Add the code to order the query in #9 from highest to lowest average star rating. Which company with more than 5000 reviews across all locations in the dataset has the highest star rating? What is that rating?

SELECT company, AVG(star_rating) 
FROM data_analyst_jobs
WHERE review_count > 5000 
AND company IS NOT NULL
GROUP BY company
ORDER BY AVG(star_rating) DESC;

--Answer:  A six-way tie with Unilever, General Motors, Nike, American Express, Microsoft, and Kaiser Permanente with an average rating of 4.2

-- 11. Find all the job titles that contain the word ‘Analyst’. How many different job titles are there?

SELECT DISTINCT title
FROM data_analyst_jobs
WHERE title ILIKE '%Analyst%';

--Answer: 774

-- 12. How many different job titles do not contain either the word ‘Analyst’ or the word ‘Analytics’? What word do these positions have in common?

SELECT DISTINCT title
FROM data_analyst_jobs
WHERE title NOT ILIKE '%Analyst%'
AND title NOT ILIKE '%Analytics%';

--Answer: 4 common word is Tableau

-- Bonus: You want to understand which jobs requiring SQL are hard to fill. Find the number of jobs by industry (domain) that require SQL and have been posted longer than 3 weeks.

SELECT domain AS industry, COUNT(*) AS num_sql_jobs
FROM (SELECT *
	  FROM data_analyst_jobs
	  WHERE skill ILIKE '%SQL%' AND days_since_posting > 21) AS sql_jobs
GROUP BY industry
HAVING domain IS NOT NULL
ORDER BY num_sql_jobs DESC;

-- ANSWER #1: Internet and Software, Banks and Financial Services, Consulting and Business Services, and Health Care

-- ANSWER #2: 62, 61, 57, and 52

