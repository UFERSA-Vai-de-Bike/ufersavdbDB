CREATE DOMAIN sex_tag AS CHAR
CHECK(
	VALUE = 'M'
	OR VALUE = 'F'
	OR VALUE = 'U'
);

CREATE DOMAIN label_tag AS CHAR
CHECK(
	VALUE = 'D'
	OR VALUE = 'L'
	OR VALUE = 'U'
);