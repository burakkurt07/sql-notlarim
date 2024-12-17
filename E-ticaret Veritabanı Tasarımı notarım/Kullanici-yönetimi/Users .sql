CREATE TABLE Users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    role ENUM('admin', 'user', 'moderator') DEFAULT 'user',
    status ENUM('active', 'inactive', 'suspended') DEFAULT 'active'
);
