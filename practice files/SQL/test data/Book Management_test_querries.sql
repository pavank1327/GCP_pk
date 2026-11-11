USE local;

select * From Authors; 

SELECT b.Title, a.Name AS Author, p.Name AS Publisher, b.Price
FROM Books b
JOIN Authors a ON b.AuthorID = a.AuthorID
JOIN Publishers p ON b.PublisherID = p.PublisherID;

-- Check customer orders:

SELECT o.OrderID, c.Name, o.OrderDate, od.Quantity, b.Title, od.Subtotal
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Books b ON od.BookID = b.BookID;

USE local;
select * from Books;