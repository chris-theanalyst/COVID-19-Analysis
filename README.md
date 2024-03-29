# COVID-19-Analysis
Exploring a Global COVID_19 data

This repository contains SQL scripts for exploring Covid-19 data. The scripts demonstrate the use of various SQL skills, including Joins, CTE's, Window Functions, Aggregate Functions, Creating Views, and Converting Data Types.

## Table of Contents

- [Introduction](#introduction)
- [View Data](#view-data)
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

## View Data
This project comprises two datasets. First is the CovidDeaths data and then the CovidVaccination data

### CovidDeath Data

![](https://github.com/chris-theanalyst/COVID-19-Analysis/blob/06b69a941eb9e2616a7001e9cb0d0d47bfb9ed6e/carbon.png)


Result
![](https://github.com/chris-theanalyst/COVID-19-Analysis/blob/82ed383cf4bf6187bf54b28f1d796f027c25ac1a/code%201.png)

### CovidVaccination Data

![](https://github.com/chris-theanalyst/COVID-19-Analysis/blob/06b69a941eb9e2616a7001e9cb0d0d47bfb9ed6e/carbon%20(1).png)


Result

![CovidVaccination Data View](https://github.com/chris-theanalyst/COVID-19-Analysis/blob/82ed383cf4bf6187bf54b28f1d796f027c25ac1a/code%202.png)

## Data Exploration

### Total Cases vs Total Deaths in Africa

The following SQL query shows the total number of cases and deaths in Africa, along with the likelihood of dying if contracting Covid-19.


![](https://github.com/chris-theanalyst/COVID-19-Analysis/blob/06b69a941eb9e2616a7001e9cb0d0d47bfb9ed6e/carbon%20(2).png)

As the number of cases increases, there is a higher chance of death occuring

![Total Cases vs Total Deaths in Africa](https://github.com/chris-theanalyst/COVID-19-Analysis/blob/82ed383cf4bf6187bf54b28f1d796f027c25ac1a/code%204a.png)

![Increase in cases equals increase in death](https://github.com/chris-theanalyst/COVID-19-Analysis/blob/82ed383cf4bf6187bf54b28f1d796f027c25ac1a/code%204a.png)

![](https://github.com/chris-theanalyst/COVID-19-Analysis/blob/82ed383cf4bf6187bf54b28f1d796f027c25ac1a/code%204c.png)

**### Total Cases vs Population**

This query calculates the percentage of the population that contracted Covid-19 in each location.


![](https://github.com/chris-theanalyst/COVID-19-Analysis/blob/06b69a941eb9e2616a7001e9cb0d0d47bfb9ed6e/carbon%20(3).png)


Result

![](https://github.com/chris-theanalyst/COVID-19-Analysis/blob/077455bb3141685d6ef53430fd2727d6c01d4b67/code%205b.png)

![](https://github.com/chris-theanalyst/COVID-19-Analysis/blob/077455bb3141685d6ef53430fd2727d6c01d4b67/code%205a.png)

![](https://github.com/chris-theanalyst/COVID-19-Analysis/blob/077455bb3141685d6ef53430fd2727d6c01d4b67/code%205cc.png)

**Countries with Highest Infection Rates**

This query shows the countries with the highest infection rates compared to their population.


![](https://github.com/chris-theanalyst/COVID-19-Analysis/blob/06b69a941eb9e2616a7001e9cb0d0d47bfb9ed6e/carbon%20(4).png)


Result

![](https://github.com/chris-theanalyst/COVID-19-Analysis/blob/077455bb3141685d6ef53430fd2727d6c01d4b67/code%206a.png)


**Countries with Highest Death Counts**

This query displays the countries with the highest death counts.


![](https://github.com/chris-theanalyst/COVID-19-Analysis/blob/06b69a941eb9e2616a7001e9cb0d0d47bfb9ed6e/carbon%20(5).png)


Result

![](https://github.com/chris-theanalyst/COVID-19-Analysis/blob/12217a0e34e3560b3ae0d52e8c30bb874012023c/code%207.png)


**Highest Death Counts by Continent**

This query shows the highest death counts by continent.


![](https://github.com/chris-theanalyst/COVID-19-Analysis/blob/06b69a941eb9e2616a7001e9cb0d0d47bfb9ed6e/carbon%20(6).png)


Result

![](https://github.com/chris-theanalyst/COVID-19-Analysis/blob/12217a0e34e3560b3ae0d52e8c30bb874012023c/code%208.png)


**Global Covid-19 Statistics**

This query shows global Covid-19 statistics, including total cases, total deaths, and death percentage.


![](https://github.com/chris-theanalyst/COVID-19-Analysis/blob/06b69a941eb9e2616a7001e9cb0d0d47bfb9ed6e/carbon%20(7).png)


Result

![](https://github.com/chris-theanalyst/COVID-19-Analysis/blob/12217a0e34e3560b3ae0d52e8c30bb874012023c/code%2010.png)


**Population vs Vaccination**

This query compares the population with the number of vaccinations to see the percentage of people vaccinated.


![](https://github.com/chris-theanalyst/COVID-19-Analysis/blob/06b69a941eb9e2616a7001e9cb0d0d47bfb9ed6e/carbon%20(8).png)

Result

![](https://github.com/chris-theanalyst/COVID-19-Analysis/blob/b2db6e03fb171f7c93ecf0d47292c7e53a09f98f/code%2011.png)



Note
The provided SQL script is for exploration purposes and assumes the existence of specific tables in the database. Ensure that you have the required data before executing these queries.


















