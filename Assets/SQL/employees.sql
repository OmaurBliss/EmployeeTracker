DROP DATABASE IF EXISTS employees;
CREATE DATABASE employees;
USE employees;
CREATE TABLE department (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(30) UNIQUE NOT NULL
);
CREATE TABLE role (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(30) UNIQUE NOT NULL,
  salary DECIMAL UNSIGNED NOT NULL,
  department_id INT UNSIGNED NOT NULL,
  INDEX dep_ind (department_id),
  CONSTRAINT fk_department FOREIGN KEY (department_id) REFERENCES department(id) ON DELETE CASCADE
);
CREATE TABLE employee (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(30) NOT NULL,
  last_name VARCHAR(30) NOT NULL,
  role_id INT UNSIGNED NOT NULL,
  INDEX role_ind (role_id),
  CONSTRAINT fk_role FOREIGN KEY (role_id) REFERENCES role(id) ON DELETE CASCADE,
  manager_id INT UNSIGNED,
  INDEX man_ind (manager_id),
  CONSTRAINT fk_manager FOREIGN KEY (manager_id) REFERENCES employee(id) ON DELETE SET NULL
);
use employees;
INSERT INTO department
    (name)
VALUES
    ('Production'),
    ('Media'),
    ('Marketing'),
    ('Executive');
INSERT INTO role
    (title, salary, department_id)
VALUES
    ('Production Lead', 5000000, 1),
    ('Audio Tech 1', 4000000, 1),
    ('Video Tech 1', 40000000, 1),
    ('Marketing Manager', 8000000, 3),
    ('Media Manager', 7000000, 2),
    ('Media Specialist', 3000000, 2),
    ('CEO', 45000000, 4),
    ('VP', 25000000, 4);
INSERT INTO employee
    (first_name, last_name, role_id, manager_id)
VALUES
    ('Amanda', 'Hugandkiss', 1, NULL),
    ('Ilean', 'Sideways', 2, 1),
    ('Makeya', 'Wannascream', 3, NULL),
    ('Dan', 'Delion', 4, 3),
    ('Shawn', 'OftheDead', 5, NULL),
    ('Pat', 'Nleather', 6, 5),
    ('Mongo', 'Smash', 7, NULL),
    ('Serine', 'Views', 8, 7);