-- Challenge Bonus queries.
-- 1. (2.5 pts)
-- Retrieve all the number of backer_counts in descending order for each `cf_id` for the "live" campaigns. 
SELECT DISTINCT (outcome) outcome, cf_id, backers_count
FROM campaign
WHERE outcome = 'live'
GROUP BY cf_id
ORDER BY backers_count DESC; 


-- 2. (2.5 pts)
-- Using the "backers" table confirm the results in the first query.
SELECT DISTINCT COUNT(backers_id) backers_id
FROM backers
GROUP BY cf_id
ORDER BY backers_id DESC; 


-- 3. (5 pts)
-- Create a table that has the first and last name, and email address of each contact.
-- and the amount left to reach the goal for all "live" projects in descending order. 
SELECT co.first_name, co.last_name, co.email, (ca.goal - ca.pledged) as remaining_goal_amt
INTO email_contacts_remaining_goal_amount
FROM contacts as co 
INNER JOIN campaign as ca
ON co.contact_id = ca.contact_id
WHERE ca.outcome = 'live'
ORDER BY remaining_goal_amt DESC;

-- Check the table
SELECT * FROM email_contacts_remaining_goal_amount;


-- 4. (5 pts)
-- Create a table, "email_backers_remaining_goal_amount" that contains the email address of each backer in descending order, 
-- and has the first and last name of each backer, the cf_id, company name, description, 
-- end date of the campaign, and the remaining amount of the campaign goal as "Left of Goal". 
SELECT b.email, b.first_name, b.last_name, ca.cf_id, ca.company_name, ca.description, ca.end_date, (ca.goal - ca.pledged) as left_of_goal
INTO email_backers_remaining_goal_amount
FROM backers as b
INNER JOIN campaign as ca
ON b.cf_id = ca.cf_id
WHERE ca.outcome = 'live'
ORDER BY last_name DESC;
--ORDER BY last_name ASC;

-- Check the table
SELECT * FROM email_backers_remaining_goal_amount;

