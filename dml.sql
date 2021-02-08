

-- Lista antalet produkter per kategori. Listningen ska innehålla kategori-namn och antalet produkter
select Category.name, count(ShoeID) from BelongsTo 
inner join Category on Category.ID=BelongsTo.CategoryID
group by Category.name;

-- Skapa en kundlista med den totala summan pengar som varje kund har handlat för. Kundens
-- för- och efternamn, samt det totala värdet som varje person har shoppats för, skall visas.
select Customer.firstName, Customer.lastName,sum(Price.value) from Customer
inner join Orders on Orders.CustomerID=Customer.ID
inner join Contains on Contains.OrdersID=Orders.ID
inner join Shoe on Shoe.ID=Contains.ShoeID
inner join Price on Price.ID=Shoe.PriceID
group by Customer.firstName, Customer.lastName;




-- Vilka kunder har köpt svarta sandaler i storlek 38 av märket Ecco? Lista deras namn.
select Customer.firstName as Namn, Customer.lastName as Efternamn from Customer
inner join Orders on Orders.CustomerID=Customer.ID
inner join Contains on Contains.OrdersID=Orders.ID
inner join Shoe on Shoe.ID=Contains.ShoeID
inner join Has on Has.ShoeID=Shoe.ID
inner join Color on Color.ID=Has.ColorID
inner join BelongsTo on BelongsTo.ShoeID=Shoe.ID
inner join Category on Category.ID=BelongsTo.CategoryID
inner join Size on Size.ID=Shoe.SizeID
inner join Brand on Brand.ID=Shoe.BrandID
where Color.name='Black' and Category.name='Sandals' and Brand.name='Ecco' and Size.format='38';



-- Vilken månad hade du den största försäljningen? (det måste finnas data som anger
-- försäljning för mer än en månad i databasen för att visa att frågan är korrekt formulerad)
select month(ordersDate) as Manad, Year(ordersDate) as Ar, sum(Price.value) as OrderSum from Orders
inner join Contains on Contains.OrdersID=Orders.ID
inner join Shoe on Shoe.ID=Contains.ShoeID
inner join Price on Price.ID=Shoe.PriceID
group by Manad, Ar
order by OrderSum desc
limit 1;


-- Skriv ut en lista på det totala beställningsvärdet per ort där beställningsvärdet är större än
-- 1000 kr. Ortnamn och värde ska visas. (det måste finnas orter i databasen där det har
-- handlats för mindre än 1000 kr för att visa att frågan är korrekt formulerad)
select City.name, sum(Price.value) as varde from Customer
inner join City on City.ID=Customer.CityID
inner join Orders on Orders.CustomerID=Customer.ID
inner join Contains on Contains.OrdersID=Orders.ID
inner join Shoe on Shoe.ID=Contains.ShoeID
inner join Price on Price.ID=Shoe.PriceID
group by City.name
having sum(Price.value) > 1000;



-- Skapa en topp-5 lista av de mest sålda produkterna. 
select Shoe.name, Size.format, count(Contains.ID) as Antal from Shoe
inner join Contains on Contains.ShoeID=Shoe.ID
inner join Size on Size.ID=Shoe.SizeID
group by Shoe.name, Size.format
order by Antal desc
limit 5;








