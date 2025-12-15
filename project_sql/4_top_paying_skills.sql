/*
Question: What are the top paying sklls based on salary?
- Look at the avarage salary associated with each skill for Data Analyst positions
- Focuses on roles with specified salaries, regardless of location
- Why? It reveals how different skils impact salary levels for Data Analysts and 
  helps identify the most financially rewarding skills to acquire or improve
*/

SELECT 
    skills,
    ROUND(AVG(salary_year_avg),0) AS avg_salary
FROM 
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL AND
    job_work_from_home = TRUE
GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT 25

/*
Big data, cloud, and engineering tools drive the highest salaries (PySpark, Databricks, Kubernetes), showing strong demand for analysts who work at scale.

High-paying roles blend analytics with engineering and MLOps skills, not just traditional reporting or SQL.

Python remains the foundation, but salaries increase significantly when paired with production, cloud, and AI platforms.
*/