# COVID-19-Analysis
Exploring a Global COVID_19 data

This repository contains SQL scripts for exploring Covid-19 data. The scripts demonstrate the use of various SQL skills, including Joins, CTE's, Window Functions, Aggregate Functions, Creating Views, and Converting Data Types.

## Table of Contents

- [Introduction](#introduction)
- [Data Exploration](#data-exploration)
  - [Total Cases vs Total Deaths in Africa](#total-cases-vs-total-deaths-in-africa)
  - [Total Cases vs Population](#total-cases-vs-population)
  - [Countries with Highest Infection Rates](#countries-with-highest-infection-rates)
  - [Countries with Highest Death Counts](#countries-with-highest-death-counts)
  - [Highest Death Counts by Continent](#highest-death-counts-by-continent)
  - [Death Rates by Continent](#death-rates-by-continent)
  - [Global Covid-19 Statistics](#global-covid-19-statistics)
  - [Population vs Vaccination](#population-vs-vaccination)

## Introduction

This project involves analyzing Covid-19 data using SQL. The data includes information on total cases, total deaths, vaccination rates, and population in various locations around the world.

## Data Exploration

### Total Cases vs Total Deaths in Africa

The following SQL query shows the total number of cases and deaths in Africa, along with the likelihood of dying if contracting Covid-19.

-- SQL Query

SELECT location, date, total_cases, total_deaths, (CAST(total_deaths AS FLOAT) / CAST(total_cases AS FLOAT)) * 100 AS death_rate
FROM PortfolioProject..CovidDeaths
WHERE location LIKE '%Africa%'
AND continent IS NOT NULL
ORDER BY 1, 2;


**### Total Cases vs Population**

This query calculates the percentage of the population that contracted Covid-19 in each location.

-- SQL Query

SELECT location, date, population, total_cases, (CAST(total_cases AS FLOAT) / CAST(population AS FLOAT)) * 100 AS InfectionRate
FROM PortfolioProject..CovidDeaths
WHERE continent IS NOT NULL
ORDER BY 1, 2;


**Countries with Highest Infection Rates**

This query shows the countries with the highest infection rates compared to their population.

-- SQL Query

SELECT location, population, MAX(total_cases) AS HighestInfectionCount, MAX((CAST(total_cases AS FLOAT) / CAST(population AS FLOAT))) * 100 AS HighestInfectionRate
FROM PortfolioProject..CovidDeaths
WHERE continent IS NOT NULL
GROUP BY location, population
ORDER BY HighestInfectionRate DESC;


**Countries with Highest Death Counts**

This query displays the countries with the highest death counts.

-- SQL Query

SELECT location, MAX(Total_deaths) AS HighestDeathCounts
FROM PortfolioProject..CovidDeaths
WHERE continent IS NOT NULL
GROUP BY location
ORDER BY HighestDeathCounts DESC;


**Highest Death Counts by Continent**

This query shows the highest death counts by continent.

-- SQL Query

SELECT continent, MAX(Total_deaths) AS HighestDeathCounts
FROM PortfolioProject..CovidDeaths
WHERE continent IS NOT NULL
GROUP BY continent
ORDER BY HighestDeathCounts DESC;


**Global Covid-19 Statistics**

This query shows global Covid-19 statistics, including total cases, total deaths, and death percentage.

-- SQL Query

SELECT SUM(new_cases) AS total_cases, SUM(new_deaths) AS total_deaths, SUM(new_deaths) / SUM(new_cases) * 100 AS DeathPercentage
FROM PortfolioProject..CovidDeaths;


**Population vs Vaccination**

This query compares the population with the number of vaccinations to see the percentage of people vaccinated.

-- SQL Query

SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
	SUM(vac.new_vaccinations) OVER (PARTITION BY dea.location, dea.date) AS RollingPeopleVaccinated
FROM PortfolioProject..CovidDeaths dea
JOIN PortfolioProject..CovidVaccinations vac
	ON dea.location = vac.location
	AND dea.date = vac.date 
WHERE dea.continent IS NOT NULL
ORDER BY 1, 2, 3;




Note
The provided SQL script is for exploration purposes and assumes the existence of specific tables in the database. Ensure that you have the required data before executing these queries.


















