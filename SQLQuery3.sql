select * from project1..HOUSING

-- Standardising Sale Date
select saledateconverted, convert (date, SaleDate) 
from project1..HOUSING

update HOUSING
set SaleDate = convert (date, SaleDate)

alter table housing
add saledateconverted date;

update HOUSING
set saledateconverted =  convert (date, SaleDate)


-- Populating property address data
select * 
from project1..HOUSING
where PropertyAddress is null
order by ParcelID

-- if parcel ID is same and property address is null, will populate it with the same address

select a.ParcelID, a.PropertyAddress, b.ParcelID, b.PropertyAddress, isnull (a.PropertyAddress, b.PropertyAddress)
from project1..HOUSING a
join project1..HOUSING b
	on a.ParcelID = b.ParcelID
	and a.[UniqueID ] <> b.[UniqueID ]
where a.PropertyAddress is null

update a
set PropertyAddress = isnull (a.PropertyAddress, b.PropertyAddress)
from project1..HOUSING a
join project1..HOUSING b
	on a.ParcelID = b.ParcelID
	and a.[UniqueID ] <> b.[UniqueID ]
where a.PropertyAddress is null

--Separting address into address, city and state
select PropertyAddress
from project1..HOUSING

select SUBSTRING ( propertyaddress, 1, CHARINDEX (',', propertyaddress)-1) as address --selecting address till ','
, SUBSTRING ( propertyaddress, CHARINDEX (',', propertyaddress) +1, len(propertyaddress)) as address --selecting address beyong ','
from project1..HOUSING

alter table housing
add propaddress nvarchar(255);

update HOUSING
set propaddress =  SUBSTRING ( propertyaddress, 1, CHARINDEX (',', propertyaddress)-1)

alter table housing
add city nvarchar(255);

update HOUSING
set city =  SUBSTRING ( propertyaddress, CHARINDEX (',', propertyaddress) +1, len(propertyaddress))

select *
from project1..HOUSING

select OwnerAddress
from project1..HOUSING 

select 
PARSENAME ( replace (owneraddress, ',','.'), 3) --since parsename looks for periods, need to replace it with a comma.
,PARSENAME ( replace (owneraddress, ',','.'), 2) --parsename goes in a reverse order
,PARSENAME ( replace (owneraddress, ',','.'), 1)
from project1..HOUSING


ALTER TABLE PROJECT1..HOUSING
ADD OWNERSTREET NVARCHAR (255);

UPDATE project1..HOUSING
SET OWNERSTREET = PARSENAME ( replace (owneraddress, ',','.'), 3)

alter table project1..housing
add ownercity nvarchar (255);

UPDATE project1..HOUSING
SET ownercity = PARSENAME ( replace (owneraddress, ',','.'), 2)

alter table project1..housing
add ownerstate nvarchar (255);

UPDATE project1..HOUSING
SET ownerstate = PARSENAME ( replace (owneraddress, ',','.'), 1)


-- Updating Y and N to Yes and No in "Sold as Vacant"

select distinct (SoldAsVacant), count (SoldAsVacant)
from project1..housing
group by SoldAsVacant
order by 2

select SoldAsVacant,
	case 
	when SoldAsVacant = 'Y' then 'Yes'
	when SoldAsVacant = 'N' then 'No'
	else SoldAsVacant
	end
from project1..housing

update project1..housing
set SoldAsVacant = case 
	when SoldAsVacant = 'Y' then 'Yes'
	when SoldAsVacant = 'N' then 'No'
	else SoldAsVacant
	end

-- removing duplicate items

with rownumcte as (
select *,
	row_number () over (
	partition by ParcelID, PropertyAddress, SaleDate, LegalReference
	order by UniqueID ) row_num
from project1..housing
)
select * 
from rownumcte
where row_num > 1


-- removing unsued columns
select * from project1..HOUSING

alter table project1..HOUSING
drop column owneraddress, taxdistrict, propertyaddress

alter table project1..HOUSING
drop column saledate

 
