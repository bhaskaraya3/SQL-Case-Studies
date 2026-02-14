CREATE TABLE customers(
	customer_id INT PRIMARY KEY,
	gender VARCHAR(10),
    married VARCHAR(5),
    dependents VARCHAR(5),
    education VARCHAR(20),
    self_employed VARCHAR(5)
);

CREATE TABLE income_details (
    customer_id INT PRIMARY KEY,
    applicant_income DECIMAL(10,2),
    coapplicant_income DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE loan_details (
    customer_id INT PRIMARY KEY,
    loan_amount DECIMAL(10,2),
    loan_amount_term INT,
    credit_history INT,
    loan_status CHAR(1),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);


CREATE TABLE property_details (
    customer_id INT PRIMARY KEY,
    property_area VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
