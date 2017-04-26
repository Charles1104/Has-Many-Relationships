
-- SELECT *
-- FROM users;

-- SELECT *
-- FROM posts
-- WHERE user_id = 100;

-- SELECT p.title, p.url, p.content, p.created_at, p.updated_at, u.firstname, u.lastname
-- FROM posts p
-- LEFT JOIN users u ON p.user_id = u.id
-- WHERE p.user_id = 200;

-- SELECT posts.*, u.username
-- FROM posts
-- LEFT JOIN users u ON posts.user_id = u.id
-- WHERE u.firstname = 'Norene'
-- AND u.lastname = 'Schmitt';

-- SELECT u.username
-- FROM posts p
-- LEFT JOIN users u ON p.user_id = u.id
-- WHERE p.created_at > '2015-01-01'::date

-- SELECT p.title, p.content, u.username
-- FROM posts p
-- LEFT JOIN users u ON p.user_id = u.id
-- WHERE p.created_at < '2015-01-01'::date;

-- SELECT c.*, p.title as "Post Title"
-- FROM comments c
-- LEFT JOIN posts p ON c.post_id = p.id;

-- SELECT p.title as post_title, p.url as post_url, c.body as comment_body
-- FROM comments c
-- INNER JOIN posts p ON c.post_id = p.id
-- WHERE p.created_at < '2015-01-01'::date;

-- SELECT p.title as post_title, p.url as post_url, c.body as comment_body
-- FROM comments c
-- INNER JOIN posts p ON c.post_id = p.id
-- WHERE p.created_at > '2015-01-01'::date;

SELECT p.title as post_title, p.url as post_url, c.body as comment_body
FROM comments c
INNER JOIN posts p ON c.post_id = p.id
WHERE c.body LIKE '%USB%'