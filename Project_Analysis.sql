
/* CrownCart - Ecommerce Platform Analysis */

-- create DATABASE Crown_Cart

use Proj_Ecom

/**************************************** Analysis of Customers ******************************************************************************/
SELECT * FROM Customers

SELECT COUNT(Customer_ID) as Total_New_Customers FROM Customers
WHERE Membership_label='New'
-------------------------------------------------------------------------------------------
SELECT COUNT(Customer_ID) as Total_Elite_Customers FROM Customers
WHERE Membership_label='Elite'
-------------------------------------------------------------------------------------------
SELECT COUNT(Customer_ID) as Total_VIP_Customers FROM Customers
WHERE Membership_label='VIP'
-------------------------------------------------------------------------------------------
SELECT COUNT(Customer_ID) as Total_Customers FROM Customers
-------------------------------------------------------------------------------------------
SELECT 
    COUNT(CASE WHEN Membership_label = 'New' THEN 1 END) AS New_Members_Count,
    COUNT(CASE WHEN Membership_label = 'Elite' THEN 1 END) AS Elite_Members_Count,
    COUNT(CASE WHEN Membership_label = 'VIP' THEN 1 END) AS VIP_Members_Count
FROM Customers;

-------------------------------------------------------------------------------------------
SELECT DISTINCT Gender FROM Customers   -- To find Unique value in a Record


-- Total no of Males and Females Customers

SELECT 
    COUNT(CASE WHEN Gender = 'Male' THEN 1 END) AS Male_Count,
    COUNT(CASE WHEN Gender = 'Female' THEN 1 END) AS Female_Count,
    COUNT(CASE WHEN Gender = 'Other' THEN 1 END) AS Other_Count
FROM Customers;


-- No of App & Website Users

SELECT 
    COUNT(CASE WHEN Preferred_Device= 'Mobile Mobile App' OR Preferred_Device='Mobile App' THEN 1 END) as Mobile_App_Users,
    COUNT(CASE WHEN Preferred_Device= 'Desktop site' THEN 1 END) as Website_Users
FROM Customers


/**************************************** Analysis of Orders ******************************************************************************/

SELECT * FROM Orders;


-- Total Orders

SELECT COUNT(Order_ID) AS Total_Orders FROM Orders;


-- Net Delivery Percentage

SELECT  
COUNT(CASE WHEN Order_Status='Delivered' THEN 1 END) as Order_Delivered,
COUNT(Order_ID) as Total_Orders,
CONCAT(CAST(COUNT(CASE WHEN Order_Status='Delivered' THEN 1 END)*100.0/(COUNT(Order_ID)) AS decimal(10,3)),'%') AS Delivered_Percentage
FROM  Orders;


-- Top 10 Selling Products

SELECT TOP 10 Product_Name, COUNT(Order_ID) as Net_Order FROM orders
WHERE Order_Status = 'Delivered'
GROUP BY Product_Name
ORDER BY Net_Order DESC;


-- Delivered/Returned/Cancelled Status

SELECT 
    COUNT(CASE WHEN Order_Status = 'Delivered' THEN 1 END) AS Total_Delivered,
    COUNT(CASE WHEN Order_Status = 'Returned' THEN 1 END) AS Total_Returned,
    COUNT(CASE WHEN Order_Status = 'Cancelled' THEN 1 END) AS Total_Cancelled
FROM Orders;


-- Favourable Payment Mode

SELECT 
    COUNT(CASE WHEN Payment_Mode = 'Debit Card' OR Payment_Mode = 'Credit Card' THEN 1 END) AS Card_Mode,
    COUNT(CASE WHEN Payment_Mode = 'COD' THEN 1 END) AS COD_Mode,
    COUNT(CASE WHEN Payment_Mode = 'UPI' THEN 1 END) AS UPI_Code,
    COUNT(CASE WHEN Payment_Mode = 'Net Banking' THEN 1 END) AS Net_Banking_Mode
FROM Orders;

-- Net Revenue Generated

SELECT SUM(Total_Amount) as Net_Revenue FROM Orders
WHERE Order_status='Delivered'

-- Integeration of Customers Portal and their Orders

SELECT * FROM Customers as C
LEFT JOIN Orders as O
ON C.Customer_ID=O.Customer_ID

-- Net Orders by each City

SELECT City, CONCAT(COUNT(O.Order_ID), '  nos') as Net_Order_By_City  FROM Customers as C
LEFT JOIN Orders as O
ON C.Customer_ID=O.Customer_ID
GROUP BY C.City
ORDER BY Net_Order_By_City DESC


-- Net Revenue By each City

SELECT C.City, Format(SUM(O.Total_Amount), 'C', 'en-IN') as Net_Revenue FROM Customers as C
LEFT JOIN Orders as O
ON C.Customer_ID=O.Customer_ID
WHERE O.Order_status='Delivered'
GROUP BY C.City
ORDER BY Net_Revenue DESC


-- Top 10 Discounted Products

SELECT * FROM Orders

SELECT TOP 10 Product_Name, FORMAT(SUM(Discount_Amount),'C','en-IN') as Net_Discount FROM Orders
GROUP BY Product_Name
ORDER BY SUM(Discount_Amount) DESC

-- Net Quantity sold out of each Product

SELECT Product_Name, CONCAT(SUM(Quantity_nos), '  nos') as Net_Quantity  FROM Orders
GROUP BY Product_Name

/**************************************** Analysis of Products ******************************************************************************/


SELECT * FROM Products

-- Top Discounted Products 

SELECT Category, Product_Name, CONCAT(Discount, ' %') as Discount_avail FROM Products
WHERE Discount>=50
ORDER BY Discount DESC

SELECT DISTINCT Category FROM Products


-- Product Catalogue

SELECT DISTINCT Category,Product_Name, Brand, FORMAT(Selling_Price,'C','en-IN') as MRP, CONCAT(Discount, ' %') as Discount_avail, Product_Rating, Stock_Quantity_nos  FROM Products
WHERE  Product_Status='Active'


-- Products that are No Longer Available

SELECT DISTINCT Category,Product_Name, Brand, Stock_Quantity_nos, Product_Status  FROM Products
WHERE  Product_Status='Discontinued'

-- Top 50 Rated Products

SELECT DISTINCT TOP 50 Category, Product_Name, Brand, Product_Rating as Rating  FROM Products
WHERE Product_Status='Active' AND Product_Rating>=4
ORDER BY Product_Rating DESC

-- Top 10 Products by Revenue

SELECT TOP 10 Product_Name, FORMAT(SUM(Total_Amount), 'C', 'en-IN') AS Net_Revenue FROM Orders
WHERE Order_Status='Delivered'
GROUP BY Product_Name
ORDER BY SUM(Total_Amount) DESC


/**************************************** Analysis of Payments ******************************************************************************/

SELECT * FROM payments


-- Success VS Failed Payment measures
 
SELECT Payment_Mode, COUNT(CASE WHEN Payment_Status='Success' THEN 1 END ) as Successful_Payments,
COUNT(CASE WHEN Payment_Status='Failed' THEN 1 END ) as Failed_Payments 
FROM Payments
GROUP BY Payment_Mode


-- Favourable Mode of Payment

SELECT Payment_Mode AS Mode_of_Payment, CONCAT(COUNT(Payment_ID), ' nos') AS Net_Transactions FROM Payments
GROUP BY Payment_Mode


