CREATE DATABASE project_equipment;

USE project_equipment;

CREATE TABLE tblCategories(
    category_id INT NOT NULL AUTO_INCREMENT,
    category_name VARCHAR(255) NOT NULL,
    category_description VARCHAR(255) NOT NULL,
    category_type VARCHAR(255) NOT NULL,
    PRIMARY KEY(category_id)
    );

CREATE TABLE tblStatus(
    status_id INT NOT NULL AUTO_INCREMENT,
    status_name VARCHAR(255) NOT NULL,
    status_notes VARCHAR(255),
    PRIMARY KEY(status_id)
    );

CREATE TABLE tblEquipment(
    equipment_id INT NOT NULL AUTO_INCREMENT,
    equipment_name VARCHAR(255) NOT NULL,
    equipment_description VARCHAR(255),
    equipment_status_id INT NOT NULL,
    status_id INT,
    PRIMARY KEY(equipment_id),
    FOREIGN KEY(status_id) REFERENCES tblStatus(status_id)
    );

CREATE TABLE tblEquip_cat(
    equip_cat_id INT NOT NULL AUTO_INCREMENT,
    category_id INT NOT NULL,
    equipment_id INT NOT NULL,
    PRIMARY KEY(equip_cat_id),
    FOREIGN KEY(category_id) REFERENCES tblCategories(category_id),
    FOREIGN KEY(equipment_id) REFERENCES tblEquipment(equipment_id)
    );

CREATE TABLE tblEquip_hire_rates(
    equip_hire_rate_id INT NOT NULL AUTO_INCREMENT,
    equipment_id INT NOT NULL,
    hire_rate_id INT NOT NULL,
    PRIMARY KEY (equip_hire_rate_id),
    FOREIGN KEY(equipment_id) REFERENCES tblEquipment(equipment_id),
    FOREIGN KEY(hire_rate_id) REFERENCES tblHire_rates(hire_rate_id)
);

CREATE TABLE tblHire_rates(
    hire_rate_id INT NOT NULL AUTO_INCREMENT,
    hire_rate_rate INT NOT NULL,
    hire_rate_period INT NOT NULL,
    PRIMARY KEY (hire_rate_id),
);

CREATE TABLE tblContact_cat(
    contact_cat_id INT NOT NULL AUTO_INCREMENT,
    category_id INT NOT NULL,
    contact_id INT NOT NULL,
    project_hr_id INT NOT NULL,
    PRIMARY KEY (contact_cat_id)
    FOREIGN KEY (category_id) REFERENCES tblCategories(category_id),
    FOREIGN KEY (contact_id) REFERENCES tblContacts(contact_id),
    FOREIGN KEY (project_hr_id) REFERENCES tblProject_hr(project_hr_id)
);

CREATE TABLE tblContacts(
    contact_id INT NOT NULL AUTO_INCREMENT,
    contact_email VARCHAR(255) NOT NULL,
    type_id INT NOT NULL,
    PRIMARY KEY (contact_id)
    FOREIGN KEY type_id REFERENCES tblType(type_id)
);

CREATE TABLE tblType(
    type_id INT NOT NULL AUTO_INCREMENT,
    type_name VARCHAR(255) NOT NULL,
    PRIMARY KEY (type_id)
);

CREATE TABLE tblCalendar (
    calender_id INT NOT NULL AUTO_INCREMENT,
    calender_date INT NOT NULL,
    project_hr_id INT NOT NULL,
    project_equip_id INT NOT NULL,
    invoice_id INT NOT NULL,
    calendar_date_confirmed VARCHAR(255) NOT NULL,
    PRIMARY KEY (calender_id)
    FOREIGN KEY (project_hr_id) REFERENCES tblProject_hr(project_equip_id),
    FOREIGN KEY (project_equip_id) REFERENCES tblProject_equip_id(project_equip_id)
);

CREATE TABLE tblProject_equipment(
    project_equip_id INT NOT NULL AUTO_INCREMENT,
    project_id INT NOT NULL,
    equipment_id INT NOT NULL,
    proj_equip_booking_rate INT NOT NULL,
    PRIMARY KEY (project_equip_id),
    FOREIGN KEY (equipment_id) REFERENCES tblEquipment(equipment_id),
    FOREIGN KEY (project_id) REFERENCES tblProjects(project_id)
);

CREATE TABLE tblProject_hr(
    project_hr_id INT NOT NULL AUTO_INCREMENT,
    project_id INT NOT NULL,
    project_testimonial VARCHAR(255) NOT NULL,
    PRIMARY KEY (project_hr_id),
    FOREIGN KEY (project_id) REFERENCES tblProjects(project_id)
);

CREATE TABLE tblProjects(
    project_id INT NOT NULL AUTO_INCREMENT,
    project_name VARCHAR(255) NOT NULL,
    project_description VARCHAR(255) NOT NULL,
    project_start_date VARCHAR(255) NOT NULL,
    project_end_date VARCHAR(255) NOT NULL,
    project_owner_id INT NOT NULL,
    contact_id INT NOT NULL,
    PRIMARY KEY (project_id),
    FOREIGN KEY (contact_id) REFERENCES tblContacts(contact_id)

);