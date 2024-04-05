CREATE DATABASE IF NOT EXISTS youtube;

USE youtube;

-- users table ---------------
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(100),
    password VARCHAR(100),
    username VARCHAR(50),
    date_of_birth DATE,
    gender ENUM('male', 'female', 'other'),
    country VARCHAR(50),
    postal_code VARCHAR(20)
);

-- videos table ---------------
CREATE TABLE videos (
    video_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100),
    description TEXT,
    size INT,
    video_file VARCHAR(255),
    duration TIME,
    thumbnail VARCHAR(255),
    views INT DEFAULT 0,
    likes INT DEFAULT 0,
    dislikes INT DEFAULT 0,
    status ENUM('public', 'hidden', 'private'),
    user_id INT,
    upload_datetime DATETIME,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- tags table ---------------
CREATE TABLE tags (
    tag_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50)
);

-- video_tags table (Many-to-Many relationship between videos and tags) ---------------
CREATE TABLE video_tags (
    video_id INT,
    tag_id INT,
    PRIMARY KEY (video_id, tag_id),
    FOREIGN KEY (video_id) REFERENCES videos(video_id),
    FOREIGN KEY (tag_id) REFERENCES tags(tag_id)
);

-- channels table ---------------
CREATE TABLE channels (
    channel_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    description TEXT,
    creation_date DATE,
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- subscriptions table (Many-to-Many relationship between users and channels) ---------------
CREATE TABLE subscriptions (
    user_id INT,
    channel_id INT,
    PRIMARY KEY (user_id, channel_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (channel_id) REFERENCES channels(channel_id)
);

-- likes table ---------------
CREATE TABLE likes (
    like_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    video_id INT,
    liked BOOLEAN,
    like_datetime DATETIME,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (video_id) REFERENCES videos(video_id)
);

-- playlists table ---------------
CREATE TABLE playlists (
    playlist_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    creation_date DATE,
    status ENUM('public', 'private'),
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- playlist_videos table (Many-to-Many relationship between playlists and videos) ---------------
CREATE TABLE playlist_videos (
    playlist_id INT,
    video_id INT,
    PRIMARY KEY (playlist_id, video_id),
    FOREIGN KEY (playlist_id) REFERENCES playlists(playlist_id),
    FOREIGN KEY (video_id) REFERENCES videos(video_id)
);

-- comments table ---------------
CREATE TABLE comments (
    comment_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    video_id INT,
    text VARCHAR(255),
    comment_datetime DATETIME,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (video_id) REFERENCES videos(video_id)
);

-- comment_likes table ---------------
CREATE TABLE comment_likes (
    like_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    comment_id INT,
    liked BOOLEAN,
    like_datetime DATETIME,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (comment_id) REFERENCES comments(comment_id)
);
