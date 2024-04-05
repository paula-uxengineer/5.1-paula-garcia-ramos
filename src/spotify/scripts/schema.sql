CREATE DATABASE IF NOT EXISTS spotify;

USE spotify;

-- users table ---------------
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(100),
    password VARCHAR(40),
    username VARCHAR(50),
    date_of_birth DATE,
    gender ENUM('male', 'female', 'other'),
    country VARCHAR(50),
    postal_code VARCHAR(20),
    user_type ENUM('free', 'premium')
);

-- subscriptions table ---------------
CREATE TABLE subscriptions (
    subscription_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    start_date DATE,
    renewal_date DATE,
    payment_method ENUM('credit_card', 'paypal'),
    credit_card_number VARCHAR(16),
    credit_card_expiry_month INT,
    credit_card_expiry_year INT,
    credit_card_security_code INT,
    paypal_username VARCHAR(80),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- payments table ---------------
CREATE TABLE payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    subscription_id INT,
    payment_date DATE,
    order_number VARCHAR(20),
    total DECIMAL(10, 2),
    FOREIGN KEY (subscription_id) REFERENCES subscriptions(subscription_id)
);

-- playlists table ---------------
CREATE TABLE playlists (
    playlist_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100),
    song_count INT,
    creation_date DATE,
    deleted BOOLEAN DEFAULT FALSE,
    deleted_date DATE
);

-- playlist_tracks table ---------------
CREATE TABLE playlist_tracks (
    playlist_id INT,
    track_id INT,
    added_by_user_id INT,
    added_date DATE,
    FOREIGN KEY (playlist_id) REFERENCES playlists(playlist_id),
    FOREIGN KEY (track_id) REFERENCES tracks(track_id),
    FOREIGN KEY (added_by_user_id) REFERENCES users(user_id)
);

-- albums table ---------------
CREATE TABLE albums (
    album_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100),
    release_year INT,
    cover_image_url VARCHAR(250)
);

-- artists table ---------------
CREATE TABLE artists (
    artist_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    artist_image_url VARCHAR(250)
);

-- favorite_albums table ---------------
CREATE TABLE favorite_albums (
    user_id INT,
    album_id INT,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (album_id) REFERENCES albums(album_id)
);

-- favorite_tracks table ---------------
CREATE TABLE favorite_tracks (
    user_id INT,
    track_id INT,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (track_id) REFERENCES tracks(track_id)
);

-- artist_followers table (Many-to-Many relationship between users and artists) ---------------
CREATE TABLE artist_followers (
    user_id INT,
    artist_id INT,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (artist_id) REFERENCES artists(artist_id)
);

-- related_artists table (Many-to-Many relationship between artists) ---------------
CREATE TABLE related_artists (
    artist_id INT,
    related_artist_id INT,
    FOREIGN KEY (artist_id) REFERENCES artists(artist_id),
    FOREIGN KEY (related_artist_id) REFERENCES artists(artist_id)
);
