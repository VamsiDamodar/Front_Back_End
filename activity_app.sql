
USE activity_app;

CREATE TABLE users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,activity_app
  email VARCHAR(255) UNIQUE NOT NULL
);
select * from users;
-- Kids Table

CREATE TABLE kids (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    avatar VARCHAR(255) NOT NULL,
    parentId INT NOT NULL,
    gender VARCHAR(10) NOT NULL,
    FOREIGN KEY (parentId) REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE kids (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    avatar VARCHAR(255) NOT NULL,
    gender VARCHAR(10) NOT NULL,
    password VARCHAR(255) NOT NULL
);


select * from kids;


-- Activities Table

-- CREATE TABLE activities (
--   id INT AUTO_INCREMENT PRIMARY KEY,
--   name VARCHAR(255) NOT NULL,
--   points INT DEFAULT 0
-- );

ALTER TABLE activities ADD COLUMN toggle BOOLEAN DEFAULT 0;
describe activities;


CREATE TABLE activities (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    points INT NOT NULL,
    frequency ENUM('Daily', 'Weekly') NOT NULL,
    days VARCHAR(255),
    start_time TIME NOT NULL,
    end_time TIME NOT NULL,
    color_code VARCHAR(7)
);
select * from kid_activities;
CREATE TABLE kid_activities (
    id INT AUTO_INCREMENT PRIMARY KEY,
    kid_id INT NOT NULL,
    activity_id INT NOT NULL,
    completed BOOLEAN DEFAULT 0, -- Tracks if activity is completed
    completion_date DATE, -- Tracks the date of completion
    FOREIGN KEY (kid_id) REFERENCES kids(id),
    FOREIGN KEY (activity_id) REFERENCES activities(id)
);
INSERT INTO kid_activities (kid_id, activity_id, completed, completion_date)
VALUES (1, 1, 1, '2024-12-07');

select * from activities;
delete from activities where name="Dance";

CREATE TABLE rewards (
    id INT AUTO_INCREMENT PRIMARY KEY,
    min_points INT NOT NULL,
    max_points INT NOT NULL,
    reward VARCHAR(255) NOT NULL
);
select * from rewards;

CREATE TABLE activity_points (
    id INT AUTO_INCREMENT PRIMARY KEY,
    activity_id INT NOT NULL, -- Links to the activities table
    user_id INT NOT NULL, -- For multiple kids/parents if required
    date DATE NOT NULL, -- Date when points were earned
    points_earned INT NOT NULL, -- Points earned for the activity on this date
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Record timestamp
    FOREIGN KEY (activity_id) REFERENCES activities(id) ON DELETE CASCADE
);
select * from activity_points;


