/*
Covid 19 Data Exploration 
Skills used: Joins, CTE's, Windows Functions, Aggregate Functions, Creating Views, Converting Data Types
*/


SELECT *
FROM PortfolioProject..CovidDeaths
WHERE continent IS NOT NULL
ORDER BY 3,4

SELECT *
FROM PortfolioProject..CovidVaccinations
ORDER BY 3,4


--Selecting the data I will be working with

SELECT location, population, date, total_cases, total_deaths, (total_deaths/total_cases)
FROM PortfolioProject..CovidDeaths
WHERE continent IS NOT NULL
ORDER BY 1,2

--Looking at Total cases vs Total deaths
--Division operator could not execute. Converted values to FLOAT.
-- Shows the likelihood of dying if contract COVID in Africa


SELECT location, date, total_cases, total_deaths, (CAST(total_deaths AS FLOAT)/CAST(total_cases AS FLOAT))*100 AS death_rate
FROM PortfolioProject..CovidDeaths
WHERE location LIKE '%Africa%'
AND continent IS NOT NULL
ORDER BY 1,2




--Looking at Total Cases vs Population
--Shows what percentage of the population got COVID

SELECT location, date, population, total_cases, (CAST(total_cases AS FLOAT)/CAST(population AS FLOAT))*100 AS InfectionRate
FROM PortfolioProject..CovidDeaths
WHERE continent IS NOT NULL
ORDER BY 1,2



--Looking at the highest infected countries compared to population

SELECT location, population, MAX(total_cases) AS HighestInfectionCount, MAX((CAST(total_cases AS FLOAT)/CAST(population AS FLOAT)))*100 AS HighestInfectionRate
FROM PortfolioProject..CovidDeaths
WHERE continent IS NOT NULL
GROUP BY location, population
ORDER BY HighestInfectionRate DESC





--Showing countries with Highest Death Count per Country

SELECT location, MAX(Total_deaths) AS HighestDeathCounts
FROM PortfolioProject..CovidDeaths
WHERE continent IS NOT NULL
GROUP BY location
ORDER BY HighestDeathCounts DESC



--Showing Highest Death Counts by Continent

SELECT continent, MAX(Total_deaths) AS HighestDeathCounts
FROM PortfolioProject..CovidDeaths
WHERE continent IS NOT NULL
GROUP BY continent
ORDER BY HighestDeathCounts DESC



--BREAKING THINGS DOWN BY POPULATION
--Showing continents with the highest death counts per population

SELECT continent,
	MAX(total_deaths) AS HighestDeathCount, 
	MAX((CAST(total_deaths AS FLOAT)/CAST(population AS FLOAT)))*100 AS HighestDeathRate
FROM PortfolioProject..CovidDeaths
WHERE continent IS NOT NULL
GROUP BY continent
ORDER BY HighestDeathRate DESC



--Global Numbers

SELECT SUM(new_cases) AS total_cases, SUM(new_deaths) AS total_deaths, SUM(new_deaths)/SUM(new_cases)*100 AS DeathPercentage
FROM PortfolioProject..CovidDeaths




--Looking at Total Population vs Vaccination

SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
	SUM(vac.new_vaccinations) OVER (PARTITION BY dea.location, dea.date) AS RollingPeopleVaccinated
	--,(RollingPeopleVaccinated/population)*100
FROM PortfolioProject..CovidDeaths dea
JOIN PortfolioProject..CovidVaccinations vac
	ON dea.location = vac.location
	AND dea.date = vac.date 
WHERE dea.continent IS NOT NULL
ORDER BY 1, 2, 3

--Using CTE

WITH PopvsVac (continent, location, date, population, new_vaccinations, RollingPeopleVaccinated)
AS
(
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
	SUM(vac.new_vaccinations) OVER (PARTITION BY dea.location, dea.date) AS RollingPeopleVaccinated
FROM PortfolioProject..CovidDeaths dea
JOIN PortfolioProject..CovidVaccinations vac
	ON dea.location = vac.location
	AND dea.date = vac.date 
WHERE dea.continent IS NOT NULL
)
SELECT *, (RollingPeopleVaccinated/population)*100
FROM PopvsVac


--Creating view to store data for visualisation later

CREATE VIEW PopvsVac 
AS
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
	SUM(vac.new_vaccinations) OVER (PARTITION BY dea.location, dea.date) AS RollingPeopleVaccinated
FROM PortfolioProject..CovidDeaths dea
JOIN PortfolioProject..CovidVaccinations vac
	ON dea.location = vac.location
	AND dea.date = vac.date 
WHERE dea.continent IS NOT NULL


CREATE VIEW GlobalDeathRate
AS
SELECT SUM(new_cases) AS total_cases, SUM(new_deaths) AS total_deaths, SUM(new_deaths)/SUM(new_cases)*100 AS DeathPercentage
FROM PortfolioProject..CovidDeaths


CREATE VIEW HighestDeathRatePerPopulation
AS 
SELECT continent,
	MAX(total_deaths) AS HighestDeathCount, 
	MAX((CAST(total_deaths AS FLOAT)/CAST(population AS FLOAT)))*100 AS HighestDeathRate
FROM PortfolioProject..CovidDeaths
WHERE continent IS NOT NULL
GROUP BY continent
--ORDER BY HighestDeathRate DESC


CREATE VIEW HighestDeathCountPerContinent
AS 
SELECT continent, MAX(Total_deaths) AS HighestDeathCounts
FROM PortfolioProject..CovidDeaths
WHERE continent IS NOT NULL
GROUP BY continent
--ORDER BY HighestDeathCounts DESC


CREATE VIEW DeathCountPerCountry
AS
SELECT location, MAX(Total_deaths) AS HighestDeathCounts
FROM PortfolioProject..CovidDeaths
WHERE continent IS NOT NULL
GROUP BY location
--ORDER BY HighestDeathCounts DESC


CREATE VIEW HighestInfection_vs_Population_Per_Country
AS
SELECT location, population, MAX(total_cases) AS HighestInfectionCount, MAX((CAST(total_cases AS FLOAT)/CAST(population AS FLOAT)))*100 AS HighestInfectionRate
FROM PortfolioProject..CovidDeaths
WHERE continent IS NOT NULL
GROUP BY location, population
--ORDER BY HighestInfectionRate DESC


CREATE VIEW Totacases_vs_Totaldeaths
AS
SELECT location, date, total_cases, total_deaths, (CAST(total_deaths AS FLOAT)/CAST(total_cases AS FLOAT))*100 AS death_rate
FROM PortfolioProject..CovidDeaths
WHERE location LIKE '%Africa%'
AND continent IS NOT NULL
--ORDER BY 1,2



CREATE VIEW TotalCases_vs_Population
AS
SELECT location, date, population, total_cases, (CAST(total_cases AS FLOAT)/CAST(population AS FLOAT))*100 AS InfectionRate
FROM PortfolioProject..CovidDeaths
WHERE continent IS NOT NULL
--ORDER BY 1,2