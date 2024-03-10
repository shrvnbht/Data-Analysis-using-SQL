select * from project1..carsales

select * from project1..carsales
where model is null

--Standardise date
select Date , convert (date, Date)
from project1..CARSALES

alter table carsales
add Sale_Date date;

update project1..CARSALES
set Sale_Date = convert (date, Date)


-- Sale of cars across months

select 
year (Sale_Date) as Sale_Year,
month (Sale_Date) as Sale_Month,
count (*) as Total_Sales_monthly
from project1..CARSALES
where Sale_Date is not null
group by year (Sale_Date), month (Sale_Date)
order by Sale_Year, Sale_Month

--Yearly Sales

select year(Sale_Date) as Sale_Year,
count(*) as Yearly_Sales
from project1..CARSALES
where Sale_Date is not null
group by year(Sale_Date)
order by Sale_Year

-- Highest, lowest, and avg value of car price

select max ([Price ($)]) as Max_Car_Price , min ([Price ($)]) as Min_Car_Price , 
avg ([Price ($)]) as Avg_Car_Price
from project1..CARSALES


-- Concatenating Company and Model 

select concat (company, ' ', Model) as Car_Name_Model
from project1..CARSALES

alter table carsales
add Car_Name_Model nvarchar (255);

update project1..CARSALES
set Car_Name_Model = concat (company, ' ', Model)


-- Distinct Dealers

select distinct Dealer_Name  from project1..CARSALES


-- Total Sales of Dealers

select Dealer_Name, sum ([Price ($)]) as Total_Dealer_Sales, avg ([Price ($)]) as Avg_Sales 
from project1..CARSALES
group by Dealer_Name
order by 2 desc

-- Regions with high sales

select Dealer_Region, count (*) as Total_Regional_Sales
from project1..CARSALES
group by Dealer_Region
order by Total_Regional_Sales desc

-- Car sales by type in different dealer regions

select Dealer_Region, Car_Name_Model, count (*) as Total_Sales
from project1..CARSALES
group by Dealer_Region, Car_Name_Model
order by Dealer_Region;

-- Top 3 selling cars in each region

with Car_Sales as (
	select Dealer_Region, Car_Name_Model, count (*) as Total_Sales,
	rank() over ( partition by Dealer_Region order by count (*) desc) as Sales_Rank
	-- rank () assigns a unqiue rank to each row within the specified conditions
	from project1..CARSALES
	group by Dealer_Region, Car_Name_Model
)
select Dealer_Region, Car_Name_Model, Total_Sales
from Car_Sales
where Sales_Rank <= 3;

-- Total gender divide

select gender, count (*) as Total_Number
from project1..CARSALES
group by Gender


-- Preference of transmission for Male and Female

select Gender, Transmission, count (*) as Gender_Preferance
from project1..CARSALES
group by Gender, Transmission
order by Gender


-- Percentage preference of transmission among male and female

select pref.Gender, pref.Transmission,
CASE 
        when total.Total_Number = 0 then 0 -- Avoid division by zero error
        else cast(pref.Gender_Preferance as decimal) / cast(total.Total_Number as decimal) * 100 
    end as Percentage_Preference

-- pref identifies the prefernce of transmission by Male and Female
from (
	select Gender, Transmission, count (*) as Gender_Preferance
from project1..CARSALES
group by Gender, Transmission
) as pref

-- Identifies the total number of male and female
join (
	select gender, count (*) as Total_Number
from project1..CARSALES
group by Gender
) as total

on pref.gender = total.gender
order by pref.gender, pref.Transmission


-- What type of body style do Male and Female prefer

select distinct [Body Style] from project1..CARSALES

select Gender, [Body Style], count (*) as Style_Preference
from project1..CARSALES
group by Gender, [Body Style]
order by Gender

-- Percentage preference

select Style.Gender, Style.[Body Style],
Case
	when G_Total.Total_Number = 0 then 0
	else cast ( Style.Style_Preference as decimal) / cast ( G_Total.Total_Number as decimal) *100
	end as body_preference

from (
	select Gender, [Body Style], count (*) as Style_Preference
from project1..CARSALES
group by Gender, [Body Style]
) as Style

join ( 
	select gender, count (*) as Total_Number
from project1..CARSALES
group by Gender ) as G_Total

on Style.Gender = G_Total.Gender
order by Style.Gender, Style.[Body Style]


