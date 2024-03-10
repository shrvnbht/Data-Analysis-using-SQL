SELECT * FROM project1..[COVID-D]
select * from project1..[COVID-V]

select location, date, total_cases, total_deaths, new_cases, population
from project1..[COVID-D]
where continent is not null
order by 1,2

-- Total Deaths vs Total Cases - Possibility of death
select location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as Deathprecentage
from project1..[COVID-D]
where location = 'India'
order by 1,2

-- Total cases vs Population - % of Population that was infected by the virus
select location, date, population, total_cases, (total_cases/population)*100 as InfectionRate
from project1..[COVID-D]
where location = 'India'
and continent is not null
order by 1,2

-- Highest infection rate by population
select location, population, max(total_cases) as HighInfectionCount, max((total_cases/population))*100 as Percent_InfectionRate
from project1..[COVID-D]
where continent is not null
group by location, population
order by Percent_InfectionRate desc

-- Countries with highest death count by population
select location, max (cast (total_deaths as int)) as DeathCount
from project1..[COVID-D]
where continent is not null
group by location
order by DeathCount desc

-- Death count by continent
select continent, max (cast (total_deaths as int)) as DeathCount
from project1..[COVID-D]
where continent is not null
group by continent
order by DeathCount desc

--SELECT date, SUM(new_cases) as Total_Cases, SUM(CAST(new_deaths AS INT)) as Total_Deaths, SUM(CAST(new_deaths AS INT))/ SUM(new_cases) *100 as DeathPercent
--from project1..[COVID-D]
--where continent is not null
--group by date 
--order by 1,2

-- Global numbers
SELECT date, SUM(new_cases) as Total_Cases, SUM(CAST(new_deaths AS INT)) as Total_Deaths, 
    CASE 
        WHEN SUM(new_cases) = 0 THEN NULL  -- Handle divide by zero
        ELSE SUM(CAST(new_deaths AS INT)) / SUM(new_cases) * 100 
    END AS death_percentage
FROM  project1..[COVID-D]
WHERE continent IS NOT NULL
GROUP BY date
ORDER BY 1,2;

-- Tota population vs vaccinations using cte
with popvsvac (continent, location, date, population, new_vaccinations, rolling_count)
as
(
select dth.continent, dth.location, dth.date, dth.population,  vac.new_vaccinations, 
sum (cast (coalesce (vac.new_vaccinations, 0 ) as bigint)) -- coalesce to replace null values with default value and number rows exceed int limit so bigint
over ( partition by dth.location order by dth.location, dth.date) as rolling_count
from project1..[COVID-D] dth
join project1..[COVID-V] vac
	on dth.location = vac.location
	and dth.date = vac.date
where dth.continent is not null
--order by 2,3
)
select * , (rolling_count/ population) *100 as PercentVaccinated
from popvsvac

-- Temp Table

drop table if exists #Percentpopvaccinated
create table #Percentpopvaccinated
( continent nvarchar (255), location nvarchar (255), date datetime,
population numeric, new_vacciantions numeric, rolling_count numeric)

insert into #Percentpopvaccinated

select dth.continent, dth.location, dth.date, dth.population,  vac.new_vaccinations, 
sum (cast (coalesce (vac.new_vaccinations, 0 ) as bigint)) -- coalesce to replace null values with default value and number rows exceed int limit so bigint
over ( partition by dth.location order by dth.location, dth.date) as rolling_count
from project1..[COVID-D] dth
join project1..[COVID-V] vac
	on dth.location = vac.location
	and dth.date = vac.date
--where dth.continent is not null
--order by 2,3

select * , (rolling_count/ population) *100 as PercentVaccinated
from #Percentpopvaccinated


-- creating view for data visualisation

create view Percentpopivaccinated as
select dth.continent, dth.location, dth.date, dth.population,  vac.new_vaccinations, 
sum (cast (coalesce (vac.new_vaccinations, 0 ) as bigint)) -- coalesce to replace null values with default value and number rows exceed int limit so bigint
over ( partition by dth.location order by dth.location, dth.date) as rolling_count
from project1..[COVID-D] dth
join project1..[COVID-V] vac
	on dth.location = vac.location
	and dth.date = vac.date
where dth.continent is not null
--order by 2,3



