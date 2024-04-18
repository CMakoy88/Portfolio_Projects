SELECT 'South America' AS region, STR_TO_DATE(date, '%d-%m-%Y') AS converted_date
FROM covid_deaths.southamerica_covid_deaths
UNION ALL
SELECT 'North America' AS region, STR_TO_DATE(date, '%d-%m-%Y') AS converted_date
FROM covid_deaths.northamerica_covid_deaths
UNION ALL
SELECT 'Africa' AS region, STR_TO_DATE(date, '%d-%m-%Y') AS converted_date
FROM covid_deaths.africa_covid_deaths
UNION ALL
SELECT 'Asia' AS region, STR_TO_DATE(date, '%d-%m-%Y') AS converted_date
FROM covid_deaths.asia_covid_deaths
UNION ALL
SELECT 'Europe' AS region, STR_TO_DATE(date, '%d-%m-%Y') AS converted_date
FROM covid_deaths.europe_covid_deaths
UNION ALL
SELECT 'Oceania' AS region, STR_TO_DATE(date, '%d-%m-%Y') AS converted_date
FROM covid_deaths.oceania_covid_deaths;


SELECT *
FROM covid_deaths.northamerica_covid_deaths
ORDER BY 3,4;

SELECT *
FROM covid_deaths.southamerica_covid_deaths
ORDER BY 3,4;


SELECT location, date, total_cases, new_cases, total_deaths, population
FROM covid_deaths.northamerica_covid_deaths
ORDER BY 1,2;

-- Viewing total cases vs total deaths in the north americas
-- Shows likeliness of death if you contract covid in your country 

SELECT location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
FROM covid_deaths.northamerica_covid_deaths
WHERE location = 'United States'
ORDER BY 1,2;


-- Viewing total cases vs population in south america
-- Displays the percentage of population in Brazil who contracted Covid

select location, date, total_cases, population, (total_cases/population)*100 as PercentPopulationInfected
from covid_deaths.southamerica_covid_deaths
Where location = 'Brazil'
order by PercentPopulationInfected;

-- Highest Infection Rate per Continent

-- Looking at Countries in the North American region with Highest Infection rate compared to population
select location, population, MAX(total_cases) as HighestInfectionCount, Max((total_cases/population))*100 as PercentPopulationInfected
from covid_deaths.northamerica_covid_deaths
group by location, population
order by PercentPopulationInfected desc;

-- Looking at Countries in the South American region with Highest Infection rate compared to population
select location, population, MAX(total_cases) as HighestInfectionCount, Max((total_cases/population))*100 as PercentPopulationInfected
from covid_deaths.southamerica_covid_deaths
group by location, population
order by PercentPopulationInfected desc;

-- Looking at Countries in Africa with Highest Infection rate compared to population
select location, population, MAX(total_cases) as HighestInfectionCount, Max((total_cases/population))*100 as PercentPopulationInfected
from covid_deaths.africa_covid_deaths
group by location, population
order by PercentPopulationInfected desc;

-- Looking at Countries in Europe region with Highest Infection rate compared to population
select location, population, MAX(total_cases) as HighestInfectionCount, Max((total_cases/population))*100 as PercentPopulationInfected
from covid_deaths.europe_covid_deaths
group by location, population
order by PercentPopulationInfected desc;

-- Looking at Countries in Asia region with Highest Infection rate compared to population
select location, population, MAX(total_cases) as HighestInfectionCount, Max((total_cases/population))*100 as PercentPopulationInfected
from covid_deaths.asia_covid_deaths
group by location, population
order by PercentPopulationInfected desc;

-- Looking at Countries in the Oceanian region with Highest Infection rate compared to population
select location, population, MAX(total_cases) as HighestInfectionCount, Max((total_cases/population))*100 as PercentPopulationInfected
from covid_deaths.oceania_covid_deaths
group by location, population
order by PercentPopulationInfected desc;

-- Highest Death Count Per Continent

-- Revealing Countries within North American region with highest death count per population
select location, MAX(cast(case when total_deaths regexp '^[0-9]+$' then total_deaths else 0 end as unsigned)) as TotalDeathCount
from covid_deaths.northamerica_covid_deaths
group by location
order by TotalDeathCount desc;

-- Revealing Countries within South American region with highest death count per population
select location, MAX(cast(case when total_deaths regexp '^[0-9]+$' then total_deaths else 0 end as unsigned )) as TotalDeathCount
from covid_deaths.southamerica_covid_deaths
group by location
order by TotalDeathCount desc;

-- Revealing Countries within Africa with highest death count per population
select location, MAX(cast(case when total_deaths regexp '^[0-9]+$' then total_deaths else 0 end as unsigned )) as TotalDeathCount
from covid_deaths.africa_covid_deaths
group by location
order by TotalDeathCount desc;

-- Revealing Countries within Asia with highest death count per population
select location, MAX(cast(case when total_deaths regexp '^[0-9]+$' then total_deaths else 0 end as unsigned )) as TotalDeathCount
from covid_deaths.asia_covid_deaths
group by location
order by TotalDeathCount desc;

-- Revealing Countries within Europe with highest death count per population
select location, MAX(cast(case when total_deaths regexp '^[0-9]+$' then total_deaths else 0 end as unsigned )) as TotalDeathCount
from covid_deaths.europe_covid_deaths
group by location
order by TotalDeathCount desc;

-- Revealing Countries within the Oceanian Region with highest death count per population
select location, MAX(cast(case when total_deaths regexp '^[0-9]+$' then total_deaths else 0 end as unsigned )) as TotalDeathCount
from covid_deaths.oceania_covid_deaths
group by location
order by TotalDeathCount desc;

-- Total Numbers per Continent

-- North America
select sum(new_cases) as total_cases, sum(cast(case when new_deaths regexp '^[0-9]+$' then total_deaths else 0 end as unsigned )) as total_deaths, (sum(cast(case when new_deaths regexp '^[0-9]+$' then total_deaths else 0 end as unsigned )) /sum(new_cases)) as DeathPercentage
from covid_deaths.northamerica_covid_deaths
-- group by date
order by 1,2;

-- South America
select sum(new_cases) as total_cases, sum(cast(case when new_deaths regexp '^[0-9]+$' then total_deaths else 0 end as unsigned )) as total_deaths, (sum(cast(case when new_deaths regexp '^[0-9]+$' then total_deaths else 0 end as unsigned )) /sum(new_cases)) as DeathPercentage
from covid_deaths.southamerica_covid_deaths
-- group by date
order by 1,2;

-- Africa
select sum(new_cases) as total_cases, sum(cast(case when new_deaths regexp '^[0-9]+$' then total_deaths else 0 end as unsigned )) as total_deaths, (sum(cast(case when new_deaths regexp '^[0-9]+$' then total_deaths else 0 end as unsigned )) /sum(new_cases)) as DeathPercentage
from covid_deaths.africa_covid_deaths
-- group by date
order by 1,2;

-- Asia
select sum(new_cases) as total_cases, sum(cast(case when new_deaths regexp '^[0-9]+$' then total_deaths else 0 end as unsigned )) as total_deaths, (sum(cast(case when new_deaths regexp '^[0-9]+$' then total_deaths else 0 end as unsigned )) /sum(new_cases)) as DeathPercentage
from covid_deaths.asia_covid_deaths
-- group by date
order by 1,2;

-- Europe
select sum(new_cases) as total_cases, sum(cast(case when new_deaths regexp '^[0-9]+$' then total_deaths else 0 end as unsigned )) as total_deaths, (sum(cast(case when new_deaths regexp '^[0-9]+$' then total_deaths else 0 end as unsigned )) /sum(new_cases)) as DeathPercentage
from covid_deaths.europe_covid_deaths
-- group by date
order by 1,2;

-- Oceania
select sum(new_cases) as total_cases, sum(cast(case when new_deaths regexp '^[0-9]+$' then total_deaths else 0 end as unsigned )) as total_deaths, (sum(cast(case when new_deaths regexp '^[0-9]+$' then total_deaths else 0 end as unsigned )) /sum(new_cases)) as DeathPercentage
from covid_deaths.oceania_covid_deaths
-- group by date
order by 1,2;

SELECT *
FROM covid_deaths.northamerica_covid_deaths dea
JOIN covid_vaccinations.northamerica_covid_vaccinations vac
    ON dea.location = vac.location 
    AND dea.date = vac.date;

-- Viewing Total Population vs Vaccination in North America

SELECT dea.location, dea.date, dea.population, vac.new_vaccinations, SUM(CAST(vac.new_vaccinations AS SIGNED)) OVER (PARTITION BY dea.location order by dea.location, dea.date) AS total_vaccinations
FROM covid_deaths.northamerica_covid_deaths dea
JOIN covid_vaccinations.northamerica_covid_vaccinations vac
ON dea.location = vac.location AND dea.date = vac.date
where dea.continent is not null
ORDER BY 1,2,3;

-- Viewing Total Population vs Vaccination in South America

SELECT dea.location, dea.date, dea.population, vac.new_vaccinations, SUM(CAST(vac.new_vaccinations AS SIGNED)) OVER (PARTITION BY dea.location order by dea.location, dea.date) AS total_vaccinations
FROM covid_deaths.southamerica_covid_deaths dea
JOIN covid_vaccinations.southamerica_covid_vaccinations vac
ON dea.location = vac.location AND dea.date = vac.date
where dea.continent is not null
ORDER BY 1,2,3;

-- Viewing Total Population vs Vaccination in Africa

SELECT dea.location, dea.date, dea.population, vac.new_vaccinations, SUM(CAST(vac.new_vaccinations AS SIGNED)) OVER (PARTITION BY dea.location order by dea.location, dea.date) AS total_vaccinations
FROM covid_deaths.africa_covid_deaths dea
JOIN covid_vaccinations.africa_covid_vaccinations vac
ON dea.location = vac.location AND dea.date = vac.date
where dea.continent is not null
ORDER BY 1,2,3;

-- Viewing Total Population vs Vaccination in Asia

SELECT dea.location, dea.date, dea.population, vac.new_vaccinations, SUM(CAST(vac.new_vaccinations AS SIGNED)) OVER (PARTITION BY dea.location order by dea.location, dea.date) AS total_vaccinations
FROM covid_deaths.asia_covid_deaths dea
JOIN covid_vaccinations.asia_covid_vaccinations vac
ON dea.location = vac.location AND dea.date = vac.date
where dea.continent is not null
ORDER BY 1,2,3;

-- Viewing Total Population vs Vaccination in Europe

SELECT dea.location, dea.date, dea.population, vac.new_vaccinations, SUM(CAST(vac.new_vaccinations AS SIGNED)) OVER (PARTITION BY dea.location order by dea.location, dea.date) AS total_vaccinations
FROM covid_deaths.europe_covid_deaths dea
JOIN covid_vaccinations.europe_covid_vaccinations vac
ON dea.location = vac.location AND dea.date = vac.date
where dea.continent is not null
ORDER BY 1,2,3;

-- Viewing Total Population vs Vaccination in Oceania

SELECT dea.location, dea.date, dea.population, vac.new_vaccinations, SUM(CAST(vac.new_vaccinations AS SIGNED)) OVER (PARTITION BY dea.location order by dea.location, dea.date) AS RollingPplVaccinated
FROM covid_deaths.oceania_covid_deaths dea
JOIN covid_vaccinations.oceania_covid_vaccinations vac
ON dea.location = vac.location AND dea.date = vac.date
WHERE dea.continent is not null
ORDER BY 1,2,3;

-- Using CTE

with PopvsVacOce 
as
(
SELECT dea.location, dea.date, dea.population, vac.new_vaccinations, SUM(CAST(vac.new_vaccinations AS SIGNED)) OVER (PARTITION BY dea.location order by dea.location, dea.date) AS RollingPplVaccinated
FROM covid_deaths.oceania_covid_deaths dea
JOIN covid_vaccinations.oceania_covid_vaccinations vac
ON dea.location = vac.location AND dea.date = vac.date
-- WHERE dea.continent is not null
-- ORDER BY 1,2,3
)
select *, (RollingPplVaccinated/population)*100
from PopvsVacOce
; 

-- Temp Table

CREATE TEMPORARY TABLE PercentagePopulationVaccinatedinOceania
(
    location VARCHAR(255),
    date DATETIME,
    population numeric,
    new_vaccinations numeric,
    RollingPplVaccinated numeric
);

INSERT INTO PercentagePopulationVaccinatedinOceania 
SELECT dea.location, STR_TO_DATE(dea.date, '%m/%d/%Y'), 
	dea.population, COALESCE(NULLIF(vac.new_vaccinations, ''), 0), 
	SUM(COALESCE(NULLIF(vac.new_vaccinations, ''), 0)) 
		OVER (PARTITION BY dea.location ORDER BY dea.date
			) AS RollingPplVaccinated
FROM 
    covid_deaths.oceania_covid_deaths dea
JOIN 
    covid_vaccinations.oceania_covid_vaccinations vac
ON 
    dea.location = vac.location AND dea.date = vac.date;

SELECT *, (RollingPplVaccinated / population) * 100 AS PercentageVaccinated
FROM PercentagePopulationVaccinatedinOceania;


-- Creating View 


Create view PercentagePopulationVaccinatedinEuro as
SELECT dea.location, dea.date, dea.population, vac.new_vaccinations, SUM(CAST(vac.new_vaccinations AS SIGNED)) OVER (PARTITION BY dea.location order by dea.location, dea.date) AS total_vaccinations
FROM covid_deaths.europe_covid_deaths dea
JOIN covid_vaccinations.europe_covid_vaccinations vac
ON dea.location = vac.location AND dea.date = vac.date
WHERE dea.continent is not null
-- ORDER BY 1,2,3;

Create view PercentagePopulationVaccinatedinNorAm as
SELECT dea.location, dea.date, dea.population, vac.new_vaccinations, SUM(CAST(vac.new_vaccinations AS SIGNED)) OVER (PARTITION BY dea.location order by dea.location, dea.date) AS total_vaccinations
FROM covid_deaths.northamerica_covid_deaths dea
JOIN covid_vaccinations.northamerica_covid_vaccinations vac
ON dea.location = vac.location AND dea.date = vac.date
WHERE dea.continent is not null
-- ORDER BY 1,2,3;

Create view PercentagePopulationVaccinatedinSouAm as
SELECT dea.location, dea.date, dea.population, vac.new_vaccinations, SUM(CAST(vac.new_vaccinations AS SIGNED)) OVER (PARTITION BY dea.location order by dea.location, dea.date) AS total_vaccinations
FROM covid_deaths.southamerica_covid_deaths dea
JOIN covid_vaccinations.southamerica_covid_vaccinations vac
ON dea.location = vac.location AND dea.date = vac.date
WHERE dea.continent is not null
-- ORDER BY 1,2,3;

Create view PercentagePopulationVaccinatedinAsia as
SELECT dea.location, dea.date, dea.population, vac.new_vaccinations, SUM(CAST(vac.new_vaccinations AS SIGNED)) OVER (PARTITION BY dea.location order by dea.location, dea.date) AS total_vaccinations
FROM covid_deaths.asia_covid_deaths dea
JOIN covid_vaccinations.asia_covid_vaccinations vac
ON dea.location = vac.location AND dea.date = vac.date
WHERE dea.continent is not null
-- ORDER BY 1,2,3;

Create view PercentagePopulationVaccinatedinOce as
SELECT dea.location, dea.date, dea.population, vac.new_vaccinations, SUM(CAST(vac.new_vaccinations AS SIGNED)) OVER (PARTITION BY dea.location order by dea.location, dea.date) AS total_vaccinations
FROM covid_deaths.oceania_covid_deaths dea
JOIN covid_vaccinations.oceania_covid_vaccinations vac
ON dea.location = vac.location AND dea.date = vac.date
WHERE dea.continent is not null
-- ORDER BY 1,2,3;

Create view PercentagePopulationVaccinatedinAfro as
SELECT dea.location, dea.date, dea.population, vac.new_vaccinations, SUM(CAST(vac.new_vaccinations AS SIGNED)) OVER (PARTITION BY dea.location order by dea.location, dea.date) AS total_vaccinations
FROM covid_deaths.africa_covid_deaths dea
JOIN covid_vaccinations.africa_covid_vaccinations vac
ON dea.location = vac.location AND dea.date = vac.date
WHERE dea.continent is not null
-- ORDER BY 1,2,3;
