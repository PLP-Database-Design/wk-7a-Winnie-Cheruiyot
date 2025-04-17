-- Question 1 Achieving 1NF (First Normal Form) 🛠️
-- To achieve First Normal Form (1NF), we need to ensure that each field contains only atomic (indivisible) values. In your ProductDetail table, the Products column contains comma-separated values, which violates 1NF.
-- We can achieve 1NF by splitting the Products column into separate rows for each product. Here's how you can do it:

SELECT 101 AS OrderID, 'John Doe' AS CustomerName, 'Laptop' AS Product
UNION ALL
SELECT 101, 'John Doe', 'Mouse'
UNION ALL
SELECT 102, 'Jane Smith', 'Tablet'
UNION ALL
SELECT 102, 'Jane Smith', 'Keyboard'
UNION ALL
SELECT 102, 'Jane Smith', 'Mouse'
UNION ALL
SELECT 103, 'Emily Clark', 'Phone';

-- the ouput is this

OrderID | CustomerName | Product
101     | John Doe     | Laptop
101     | John Doe     | Mouse
102     | Jane Smith   | Tablet
102     | Jane Smith   | Keyboard
102     | Jane Smith   | Mouse
103     | Emily Clark  | Phone

-- Question 2 Achieving 2NF (Second Normal Form) 🧩
-- in our table, the primary key is (OrderID, Product), and CustomerName depends only on OrderID, which violates 2NF.
-- To achieve 2NF, we need to separate the data into two tables: one for Orders and one for Products. Here's how you can do it:
-- 1. Create the Orders table with OrderID and CustomerName.

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

-- insert data into Orders table

INSERT INTO Orders (OrderID, CustomerName) VALUES
(101, 'John Doe'),
(102, 'Jane Smith'),
(103, 'Emily Clark');

-- output for orders table

OrderID | CustomerName
101     | John Doe
102     | Jane Smith
103     | Emily Clark

-- 2. Create the Products table with OrderID and Product.

CREATE TABLE OrderItems (
    OrderID INT,
    Product VARCHAR(100),
    Quantity INT,
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- insert data into Products table

INSERT INTO OrderItems (OrderID, Product, Quantity) VALUES
(101, 'Laptop', 2),
(101, 'Mouse', 1),
(102, 'Tablet', 3),
(102, 'Keyboard', 1),
(102, 'Mouse', 2),
(103, 'Phone', 1);
 
-- output for orderitems table

OrderID | Product  | Quantity
101     | Laptop   | 2
101     | Mouse    | 1
102     | Tablet   | 3
102     | Keyboard | 1
102     | Mouse    | 2
103     | Phone    | 1