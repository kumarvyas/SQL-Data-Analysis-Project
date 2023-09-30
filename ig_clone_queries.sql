-- 1-- Create an ER diagram or draw a schema for the given database.

-- ans--  Database-->reverse engineer database--> next--> fill password--> next--> select database-->next
 -- > next--> execute--> next--> finish--> Then ER Diagram

-- 2. We want to reward the user who has been around the longest, Find the 5 oldest users

SELECT * FROM users ORDER BY created_at ASC LIMIT 5;


-- 3. To target inactive users in an email ad campaign, find the users who have never posted a photo

select * from users where id Not in (select user_id from photos);


-- 4. Suppose you are running a contest to find out who got the most likes on a photo. Find out who won?

SELECT username,photos.id,photos.image_url, COUNT(*) AS total
FROM photos INNER JOIN likes ON likes.photo_id = photos.id
INNER JOIN users
    ON photos.user_id = users.id
GROUP BY photos.id
ORDER BY total DESC
LIMIT 1;

-- 5. The investors want to know how many times does the average user post.

SELECT round((SELECT COUNT(*)FROM photos)/(SELECT COUNT(*) FROM users)) as average;

-- 6. A brand wants to know which hashtag to use on a post, and find the top 5 most used hashtags.

SELECT tag_name, COUNT(tag_name) AS total
FROM tags
JOIN photo_tags ON tags.id = photo_tags.tag_id
GROUP BY tags.id
ORDER BY  total DESC limit 5;

-- 7. To find out if there are bots, find users who have liked every single photo on the site

SELECT users.id,username, COUNT(users.id) As total_likes_by_user
FROM users
JOIN likes ON users.id = likes.user_id
GROUP BY users.id
HAVING total_likes_by_user = (SELECT COUNT(*) FROM photos);

-- 8. Find the users who have created instagramid in may and select top 5 newest joinees from it?

select * from users where monthname(created_at)='may' order by created_at desc limit 5;

-- 9. Can you help me find the users whose name starts with c and ends with any number and have 
-- posted the photos as well as liked the photos?


SELECT * FROM users WHERE username RLIKE '^c' AND username RLIKE '[1-9]$'
AND id IN (SELECT user_id FROM photos)
AND id in (SELECT user_id FROM likes);


-- 10. Demonstrate the top 30 usernames to the company who have posted photos in the range of 3 to 5

WITH user_photos AS (SELECT user_id,COUNT(user_id) AS 'NO_OF_POSTS' FROM photos GROUP BY user_id)
SELECT * FROM users u JOIN user_photos up ON u.id=up.user_id
WHERE NO_OF_POSTS BETWEEN 3 AND 5 ORDER BY no_of_posts ASC LIMIT 30;
