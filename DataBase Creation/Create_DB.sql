CREATE DATABASE Sales_Insights

CREATE TABLE Categories (
    Product_ID INT,
    Item VARCHAR(100),
    Category_ID INT,
    Product_Category VARCHAR(100),
    Price_per_unit DECIMAL(10, 2)
);

CREATE TABLE Marketing_Cost (
    Category_ID INT,
    Marketing_Cost DECIMAL(10, 2)
);

CREATE TABLE Retail_Sales (
    Store_ID VARCHAR (50),
    Date DATE,
    Product_ID INT,
    Units_Sold INT,
    Sales_Revenue DECIMAL(15, 2),
    Discount_ID INT,
    Store_Location VARCHAR(100),
    Category_ID INT,
    Day_of_the_Week VARCHAR(50),
    Holiday_Effect BOOLEAN
);