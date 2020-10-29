CREATE TABLE IF NOT EXISTS websites
( website_id INT(11) NOT NULL AUTO_INCREMENT,
  website_name VARCHAR(25) NOT NULL,
  server_name VARCHAR(20),
  text VARCHAR(256),
  creation_date DATE,
  websites_pk INT NULL,
  CONSTRAINT websites_pk PRIMARY KEY (website_id)
);

CREATE TABLE IF NOT EXISTS pages
( page_id INT(11) NOT NULL AUTO_INCREMENT,
  website_id INT(11) NOT NULL,
  host_name VARCHAR(45) NOT NULL DEFAULT 'TBD',
  CONSTRAINT pages_pk PRIMARY KEY (page_id)
);
