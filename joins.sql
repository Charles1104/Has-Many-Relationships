-- 1
SELECT *
FROM users;

-- 2
SELECT *
FROM posts
WHERE user_id = 100;

-- 3
SELECT p.title, p.url, p.content, p.created_at, p.updated_at, u.firstname, u.lastname
FROM posts p
LEFT JOIN users u ON p.user_id = u.id
WHERE p.user_id = 200;

-- 4
SELECT posts.*, u.username
FROM posts
LEFT JOIN users u ON posts.user_id = u.id
WHERE u.firstname = 'Norene'
AND u.lastname = 'Schmitt';

-- 5
SELECT u.username
FROM posts p
LEFT JOIN users u ON p.user_id = u.id
WHERE p.created_at > '2015-01-01'::date

-- 6
SELECT p.title, p.content, u.username
FROM posts p
LEFT JOIN users u ON p.user_id = u.id
WHERE p.created_at < '2015-01-01'::date;

-- 7
SELECT c.*, p.title as "Post Title"
FROM comments c
LEFT JOIN posts p ON c.post_id = p.id;

-- 8
SELECT p.title as post_title, p.url as post_url, c.body as comment_body
FROM comments c
INNER JOIN posts p ON c.post_id = p.id
WHERE p.created_at < '2015-01-01'::date;

-- 9
SELECT p.title as post_title, p.url as post_url, c.body as comment_body
FROM comments c
INNER JOIN posts p ON c.post_id = p.id
WHERE p.created_at > '2015-01-01'::date;

-- 10
SELECT p.title as post_title, p.url as post_url, c.body as comment_body
FROM comments c
INNER JOIN posts p ON c.post_id = p.id
WHERE c.body LIKE '%USB%'

-- 11
SELECT p.title as post_title, u.firstname, u.lastname, c.body as comment_body
FROM comments c
INNER JOIN posts p ON c.post_id = p.id
INNER JOIN users u ON p.user_id = u.id
WHERE c.body LIKE '%matrix%';

-- 12
SELECT u.firstname, u.lastname, c.body as comment_body
FROM comments c
INNER JOIN posts p ON c.post_id = p.id
INNER JOIN users u ON p.user_id = u.id
WHERE c.body LIKE '%SSL%'
AND p.content LIKE '%dolorum%'

-- 13
SELECT
 u.firstname as post_author_first_name,
 u.lastname as post_author_last_name,
 p.title as post_title,
 (
   SELECT u1.firstname
   FROM users u1
   WHERE u1.id = c.user_id
 ) as comment_author_username,
 c.body as comment_body
FROM comments c
INNER JOIN posts p ON c.post_id = p.id
INNER JOIN users u ON p.user_id = u.id
WHERE (c.body LIKE '%SSL%' OR c.body LIKE '%firewall%')
AND p.content LIKE '%nemo%'


-- VERSION B
SELECT
  u.firstname as post_author_first_name,
  u.lastname as post_author_last_name,
  p.title as post_title,
  (
    SELECT u1.username
    FROM users u1
    WHERE u1.id = c.user_id
  ) as comment_author_username,
  c.body as comment_body
FROM comments c, users u, posts p
WHERE c.post_id = p.id
AND p.user_id = u.id
AND (c.body LIKE '%SSL%' OR c.body LIKE '%firewall%')
AND p.content LIKE '%nemo%';


-- BONUS 1
SELECT
  p.id as post_id,
  p.title as post_title,
  c.user_id as user_id

FROM comments c, posts p
WHERE p.user_id = c.user_id
AND c.post_id = p.id;

-- BONUS 2
-- SELECT count(*)
-- FROM comments
-- INNER JOIN posts ON comments.post_id = posts.id
-- WHERE posts.created_at > '2015-07-14'::date;

-- BONUS 3
-- SELECT u.username
-- FROM comments c
-- INNER JOIN posts p ON c.post_id = p.id
-- INNER JOIN users u ON p.user_id = u.id
-- WHERE c.body LIKE '%programming%';