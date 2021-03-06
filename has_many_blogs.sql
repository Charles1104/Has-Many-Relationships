DROP table IF EXISTS users CASCADE;

CREATE TABLE IF NOT EXISTS users (
  id SERIAL PRIMARY KEY,
  username VARCHAR(90) NOT NULL,
  firstname VARCHAR(90) DEFAULT NULL,
  lastname VARCHAR(90) DEFAULT NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT now(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT now()
);

DROP table IF EXISTS posts CASCADE;

CREATE TABLE IF NOT EXISTS posts (
  id SERIAL PRIMARY KEY,
  title CHARACTER VARYING(180) DEFAULT NULL,
  url CHARACTER VARYING(510)  DEFAULT NULL,
  content TEXT DEFAULT NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT now(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT now(),
  user_id INTEGER NOT NULL REFERENCES users(id)
);

DROP table IF EXISTS comments CASCADE;

CREATE TABLE IF NOT EXISTS comments (
  id SERIAL PRIMARY KEY,
  body VARCHAR(510) DEFAULT NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT now(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT now(),
  user_id INTEGER NOT NULL REFERENCES users(id),
  post_id INTEGER NOT NULL REFERENCES posts(id)
);