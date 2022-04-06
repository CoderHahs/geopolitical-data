/*Drill Down*/
/* Select average country population for each country in the database. */
SELECT co.longname, AVG(co.totalpopulation) as population
FROM public.fact_table f, public.country_dimension co
WHERE f.countrykey=co.countrykey
GROUP BY co.longname

/*Roll Up*/ 
/* Select the average population per country to per continent for our entire schema. */
SELECT co.continent, AVG(co.totalpopulation) as avg_pop
FROM public.fact_table f, public.country_dimension co
WHERE f.countrykey=co.countrykey
GROUP BY co.continent

/*Slice operation*/
/* Select all political events per country for the year 2008. */
SELECT f.countrykey, pol.*, co.longname
FROM public.fact_table f, public.month_dimension mon, public.politicalevent_dimension pol, public.country_dimension co
WHERE f.politicaleventkey=pol.politicaleventkey and mon.monthkey=f.monthkey and f.countrykey=co.countrykey and mon.year='2008'

/*Dice 1*/
/* Select the literacy rates for youth male (age 15 to 24) in the countries Mexico (developed) and Kenya (developing) and where the year is 2007. */
SELECT DISTINCT f.countrykey, edu.literacy_rate_youth_male_15_to_24, co.longname
FROM public.fact_table f, public.education_dimension edu, public.month_dimension mon, public.country_dimension co
WHERE f.educationkey=edu.educationkey and mon.monthkey=f.monthkey and f.countrykey=co.countrykey and (co.countrykey='MEX' or co.countrykey='KEN') and mon.year='2007' and edu.literacy_rate_youth_male_15_to_24 is not NULL

/*Dice 2*/
/* Select all natural disaster subtypes per country where the disaster type is 'Epidemic' and the year is '2009'. */
SELECT DISTINCT f.countrykey, nat.disaster_type, nat.disaster_subtype, co.longname
FROM public.fact_table f, public.naturaldisaster_dimension nat, public.month_dimension mon, public.country_dimension co
WHERE f.naturaldisastereventkey=nat.naturaldisastereventkey and mon.monthkey=f.monthkey and f.countrykey=co.countrykey and nat.disaster_type='Epidemic' and mon.year='2009'

/*4 OLAP QUERIES*/
/* Comparing literacy rate of youth male between 15 and 24 of Mexico in 2005 vs 2008. */
SELECT DISTINCT f.countrykey,f.year, edu.literacy_rate_youth_male_15_to_24
FROM public.fact_table f, public.education_dimension edu, public.month_dimension mon
WHERE f.educationkey=edu.educationkey and f.countrykey='MEX' and mon.monthkey=f.monthkey and (mon.year='2008' or mon.year='2005') and edu.literacy_rate_youth_male_15_to_24 is not NULL

/*Comparing prevalence of overweight adults (percentage of adults) of Canada and USA for every year in the database. */
SELECT DISTINCT f.countrykey, mon.year, health.prevalence_of_overweight_adults_percentage_of_adults
FROM public.fact_table f, public.health_dimension health, public.month_dimension mon
WHERE f.educationkey=health.healthkey and mon.monthkey=f.monthkey and (f.countrykey='USA' or f.countrykey='CAN') and health.prevalence_of_overweight_adults_percentage_of_adults is not NULL
ORDER BY mon.year ASC

/* Comparison of average human development index between Mexico, Canada and USA through 2005 to 2018 with the total number of political events in that year. */
SELECT f.countrykey, mon.year, avg(f.human_development_index) as human_development_index, sum(p.sumevents) as tot_events
FROM public.fact_table f, public.politicalevent_dimension p, public.month_dimension mon
WHERE f.politicaleventkey=p.politicaleventkey and mon.monthkey=f.monthkey and mon.year>=2005 and mon.year<=2018 and (f.countrykey='MEX' or f.countrykey='CAN' or f.countrykey='USA') and f.human_development_index is not NULL
GROUP BY f.countrykey, mon.year
ORDER BY mon.year ASC

/* Total population comparison of all countries with the total number of deaths of that year due to natural disasters. */
SELECT f.countrykey, mon.year, avg(co.totalpopulation) as avg_population, sum(d.total_deaths) as sum_of_deaths
FROM public.fact_table f, public.naturaldisaster_dimension d, public.month_dimension mon, public.country_dimension co
WHERE f.naturaldisastereventkey=d.naturaldisastereventkey and co.countrykey=f.countrykey and mon.monthkey=f.monthkey and mon.year>2000 and mon.year<2018  
GROUP BY f.countrykey, mon.year
ORDER BY mon.year ASC

/*Iceberg query
Viewing the 5 largest increases of net primary school enrollment of all countries between 2008 and 2015. In our DB there are only 8 countries but if we kept all countries in the world this query would be very large and keeping the top 5 would make more sense.*/
SELECT DISTINCT f.countrykey, MAX(edu2.school_enrollment_primary_net)-Max(edu1.school_enrollment_primary_net)  as Diff
FROM public.fact_table f, public.fact_table f2, public.education_dimension edu1, public.education_dimension edu2
WHERE f.educationkey = edu1.educationkey and f2.educationkey = edu2.educationkey and f.year = 2008 and f2.year = 2015 and f.facttablekey <> f2.facttablekey and edu2.school_enrollment_primary_net is not null and edu1.school_enrollment_primary_net is not null
Group by f.countrykey
ORDER BY Diff DESC
FETCH FIRST 5 ROWS ONLY

/*Windowing query
Ranking the average urban population of all countries every year between 2005 and 2018*/
SELECT c.longname, mon.year, avg(p.urban_population) as avg_urban_pop, ROW_NUMBER() OVER (PARTITION BY c.longname) av_rank
FROM public.fact_table f, public.country_dimension c, public.population_dimension p, public.month_dimension mon
WHERE f.populationkey=p.populationkey and mon.monthkey=f.monthkey and mon.year>=2005 and mon.year<=2018 and f.countrykey=c.countrykey
GROUP BY c.longname, mon.year
ORDER BY mon.year, c.longname

/*Window clause query
Comparing the percentage of births attended by skilled health staff in Mexico between 2005 to 2018*/
SELECT DISTINCT f.countrykey, f.year, MAX(health.births_attended_by_skilled_health_staff_percentage_of_total) OVER w
FROM public.fact_table as f, public.health_dimension as health
WHERE f.healthkey = health.healthkey and health.births_attended_by_skilled_health_staff_percentage_of_total is not null and f.countrykey='MEX'  and f.year>=2005 and f.year<=2018
WINDOW w AS (PARTITION BY f.countrykey ORDER BY f.year ASC)