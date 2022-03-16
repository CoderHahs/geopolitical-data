create table country_dimension(
    countryKey varchar(50) PRIMARY KEY,
    tableName varchar(50) NOT NULL,
    longName varchar(50) NOT NULL,
    region varchar(50) NOT NULL,
    currencyUnit varchar(50) NOT NULL,
    incomeGroup varchar(50) NOT NULL,
    systemOfTrade varchar(50),
    governmentAccountingConcept varchar(50),
    lendingCategory varchar(50),
    continent varchar(50) not null,
    capital varchar(50) not NULL,
    totalPopulation numeric not NULL
);

create table month_dimension(
    monthKey numeric PRIMARY KEY,
    month numeric,
    quarter numeric,
    year numeric not null,
    decade varchar(50) not null,
    CONSTRAINT chk_month CHECK(month BETWEEN 1 and 12),
    CONSTRAINT chk_quarter CHECK(quarter BETWEEN 1 and 4)
);

create table education_dimension(
    educationKey numeric PRIMARY KEY,
    countryKey varchar(50) not null,
    monthKey numeric not null,
    literacy_rate_youth_male_15_to_24 decimal,
    literacy_rate_youth_total_15_to_24 decimal,
    literacy_rate_adult_female_15_and_above decimal,
    literacy_rate_adult_male_15_and_above decimal,
    literacy_rate_adult_total_15_and_above decimal,
    primary_completion_rate_female_relevant_age decimal,
    primary_completion_rate_male_relevant_age decimal,
    primary_completion_rate_total_relevant_age decimal,
    school_enrollment_primary_gross decimal,
    school_enrollment_primary_female_gross decimal,
    school_enrollment_primary_male_gross decimal,
    school_enrollment_primary_net decimal,
    school_enrollment_primary_female_net decimal,
    school_enrollment_primary_male_net decimal,
    school_enrollment_secondary_gross decimal,
    school_enrollment_secondary_female_gross decimal,
    school_enrollment_secondary_male_gross decimal,
    school_enrollment_secondary_net decimal,
    school_enrollment_secondary_female_net decimal,
    school_enrollment_secondary_male_net decimal,
    school_enrollment_tertiary_gross decimal,
    school_enrollment_tertiary_female_gross decimal,
    FOREIGN key (countryKey) references country_dimension(countryKey) ON DELETE CASCADE,
    FOREIGN key (monthKey) references month_dimension(monthKey) ON DELETE CASCADE
);



create table health_dimension(
    healthKey numeric primary key,
    countryKey varchar(50) not null,
    monthKey numeric not null,
    total_alcohol_consumption_per_capita_female_liters_pure_project_estimates_female_15_and_above decimal,
    total_alcohol_consumption_per_capita_liters_pure_project_estimates_female_15_and_above decimal,
    total_alcohol_consumption_per_capita_male_liters_pure_project_estimates_female_15_and_above decimal,
    prevalence_of_anemia_among_women_of_reproductive_age_15_to_49_percentage decimal,
    prevalence_of_anemia_among_children_age_6_to_59_months_percentage decimal,
    prevalence_of_anemia_among_non_pregnant_women_of_reproductive_age_15_to_49_percentage decimal,
    adults_living_with_hiv_15_and_above numeric,
    aids_estimated_deaths_unaids_estimates numeric,
    womens_share_of_population_ages_15_and_above_living_with_hiv_percentage decimal,
    prevalence_of_hiv_total_percentage_of_population_ages_15_to_49 decimal,
    children_0_to_14_living_with_hiv numeric,
    prevalence_of_hiv_female_ages_15_to_24_percentage decimal,
    prevalence_of_hiv_male_ages_15_to_24_percentage decimal,
    antiretroviral_therapy_coverage_percent_of_people_living_with_hiv decimal,
    adults_15_to_49_newly_infected_with_hiv numeric,
    children_0_to_14_newly_infected_with_hiv numeric,
    incidence_of_hiv__50_and_above_per_thousand_uninfected_population decimal,
    adults_15_and_above_and_children_0_to_14_newly_infected_with_hiv numeric,
    incidence_of_hiv_all_per_thousand_uninfected_population decimal,
    young_people_15_to_24_newly_infected_with_hiv numeric,
    incidence_of_hiv_15_to_24_per_thousand_uninfected_population_15_to_24 decimal,
    incidence_of_hiv_15_to_49_per_thousand_uninfected_population_15_to_49 decimal,
    children_orphaned_by_hiv_aids numeric,
    antiretroviral_therapy_coverage_for_pmtct_percent_of_pregnat_women_living_with_hiv decimal,
    adults_15_and_above_and_childer_0_to_14_living_with_hiv numeric,
    immunization_hepb3_percentage_of_one_year_old_children decimal,
    immunization_hib3_percentage_of_12_to_23_months_children decimal,
    immunization_bcg_percentage_of_one_year_old_children decimal,
    immunization_dpt_percentage_of_12_to_23_months_children decimal,
    immunization_measles_second_dose_percentage_of_children_by_nationally_recommended_age decimal,
    immunization_measles_percentage_of_12_to_23_months_children decimal,
    immunization_pol3_percentage_of_one_year_old_children decimal,
    incidence_of_malaria_per_thousand_population_at_risk decimal,
    number_of_maternal_deaths numeric,
    lifetime_risk_of_maternal_death_one_in_value numeric,
    lifetime_risk_of_maternal_death_percentage decimal,
    prevalence_of_anemia_among_pregnant_women_percentage decimal,
    prevalence_of_syphilis_percentage_of_women_attending_antenatal_care decimal,
    prevalence_of_current_tobacco_use_percentage_adults decimal,
    prevalence_of_current_tobacco_use_females_percentage_female_adults decimal,
    prevalence_of_current_tobacco_use_males_percentage_male_adults decimal,
    births_attended_by_skilled_health_staff_percentage_of_total decimal,
    low_birthweight_babies_percentage_of_births decimal,
    prevalence_of_underweight_weight_for_age_female_percentage_of_children_under_five decimal,
    prevalence_of_underweight_weight_for_age_male_percentage_of_children_under_five decimal,
    prevalence_of_underweight_weight_for_age_percentage_of_children_under_five decimal,
    malaria_cases_reported numeric,
    maternal_mortality_ratio_modeled_estimate_per_onehundredthousand_live_births decimal,
    maternal_mortality_ratio_national_estimate_per_onehundredthousand_live_births decimal,
    prevalence_of_overweight_female_percentage_of_female_adults decimal,
    prevalence_of_overweight_male_percentage_of_male_adults decimal,
    prevalence_of_overweight_adults_percentage_of_adults decimal,
    prevalence_of_stunting_height_for_age_female_percentage_children_under_five decimal,
    prevalence_of_stunting_height_for_age_male_percentage_children_under_five decimal,
    prevalence_of_stunting_height_for_age_percentage_children_under_five decimal,
    prevalence_of_wasting_weight_for_height_female_percentage_children_under_five decimal,
    prevalence_of_wasting_weight_for_height_male_percentage_children_under_five decimal,
    prevalence_of_wasting_weight_for_height_percentage_children_under_five decimal,
    prevalence_of_severe_wasting_weight_for_height_female_percentage_children_under_five decimal,
    prevalence_of_severe_wasting_weight_for_height_male_percentage_children_under_five decimal,
    prevalence_of_severe_wasting_weight_for_height_percentage_children_under_five decimal,
    tuberculosis_treatment_success_rate_percentage_of_new_cases decimal,
    tuberculosis_case_detection_rate_percentage_all_forms decimal,
    incidence_of_tuberculosis_per_onehundredthousand_people decimal,
    tuberculosis_death_rate_per_onehundredthousand_people decimal,
    newbornds_protected_against_tetanus_percentage decimal,
    number_of_people_who_are_undernourished numeric,
    prevalence_of_undernourishment_percentage_of_population decimal,
    vitamin_a_supplementation_coverage_rate_percentage_children_ages_6_to_59_months decimal,
    adolescent_fertility_rate_births_per_thousand_women_ages_15_to_19 decimal,
    contraceptive_prevalence_any_method_percentage_married_women_ages_15_to_49 decimal,
    FOREIGN key (countryKey) references country_dimension(countryKey) ON DELETE CASCADE,
    FOREIGN key (monthKey) references month_dimension(monthKey) ON DELETE CASCADE
);
/* for health dimension
NOTICE:  identifier "total_alcohol_consumption_per_capita_female_liters_pure_project_estimates_female_15_and_above" will be truncated to "total_alcohol_consumption_per_capita_female_liters_pure_project"
NOTICE:  identifier "total_alcohol_consumption_per_capita_liters_pure_project_estimates_female_15_and_above" will be truncated to "total_alcohol_consumption_per_capita_liters_pure_project_estima"
NOTICE:  identifier "total_alcohol_consumption_per_capita_male_liters_pure_project_estimates_female_15_and_above" will be truncated to "total_alcohol_consumption_per_capita_male_liters_pure_project_e"
NOTICE:  identifier "prevalence_of_anemia_among_women_of_reproductive_age_15_to_49_percentage" will be truncated to "prevalence_of_anemia_among_women_of_reproductive_age_15_to_49_p"
NOTICE:  identifier "prevalence_of_anemia_among_children_age_6_to_59_months_percentage" will be truncated to "prevalence_of_anemia_among_children_age_6_to_59_months_percenta"
NOTICE:  identifier "prevalence_of_anemia_among_non_pregnant_women_of_reproductive_age_15_to_49_percentage" will be truncated to "prevalence_of_anemia_among_non_pregnant_women_of_reproductive_a"
NOTICE:  identifier "womens_share_of_population_ages_15_and_above_living_with_hiv_percentage" will be truncated to "womens_share_of_population_ages_15_and_above_living_with_hiv_pe"
NOTICE:  identifier "antiretroviral_therapy_coverage_percent_of_people_living_with_hiv" will be truncated to "antiretroviral_therapy_coverage_percent_of_people_living_with_h"
NOTICE:  identifier "incidence_of_hiv__50_and_above_per_thousand_uninfected_population" will be truncated to "incidence_of_hiv__50_and_above_per_thousand_uninfected_populati"
NOTICE:  identifier "adults_15_and_above_and_children_0_to_14_newly_infected_with_hiv" will be truncated to "adults_15_and_above_and_children_0_to_14_newly_infected_with_hi"
NOTICE:  identifier "incidence_of_hiv_15_to_24_per_thousand_uninfected_population_15_to_24" will be truncated to "incidence_of_hiv_15_to_24_per_thousand_uninfected_population_15"
NOTICE:  identifier "incidence_of_hiv_15_to_49_per_thousand_uninfected_population_15_to_49" will be truncated to "incidence_of_hiv_15_to_49_per_thousand_uninfected_population_15"
NOTICE:  identifier "antiretroviral_therapy_coverage_for_pmtct_percent_of_pregnat_women_living_with_hiv" will be truncated to "antiretroviral_therapy_coverage_for_pmtct_percent_of_pregnat_wo"
NOTICE:  identifier "immunization_measles_second_dose_percentage_of_children_by_nationally_recommended_age" will be truncated to "immunization_measles_second_dose_percentage_of_children_by_nati"
NOTICE:  identifier "prevalence_of_syphilis_percentage_of_women_attending_antenatal_care" will be truncated to "prevalence_of_syphilis_percentage_of_women_attending_antenatal_"
NOTICE:  identifier "prevalence_of_current_tobacco_use_females_percentage_female_adults" will be truncated to "prevalence_of_current_tobacco_use_females_percentage_female_adu"
NOTICE:  identifier "prevalence_of_underweight_weight_for_age_female_percentage_of_children_under_five" will be truncated to "prevalence_of_underweight_weight_for_age_female_percentage_of_c"
NOTICE:  identifier "prevalence_of_underweight_weight_for_age_male_percentage_of_children_under_five" will be truncated to "prevalence_of_underweight_weight_for_age_male_percentage_of_chi"
NOTICE:  identifier "prevalence_of_underweight_weight_for_age_percentage_of_children_under_five" will be truncated to "prevalence_of_underweight_weight_for_age_percentage_of_children"
NOTICE:  identifier "maternal_mortality_ratio_modeled_estimate_per_onehundredthousand_live_births" will be truncated to "maternal_mortality_ratio_modeled_estimate_per_onehundredthousan"
NOTICE:  identifier "maternal_mortality_ratio_national_estimate_per_onehundredthousand_live_births" will be truncated to "maternal_mortality_ratio_national_estimate_per_onehundredthousa"
NOTICE:  identifier "prevalence_of_stunting_height_for_age_female_percentage_children_under_five" will be truncated to "prevalence_of_stunting_height_for_age_female_percentage_childre"
NOTICE:  identifier "prevalence_of_stunting_height_for_age_male_percentage_children_under_five" will be truncated to "prevalence_of_stunting_height_for_age_male_percentage_children_"
NOTICE:  identifier "prevalence_of_stunting_height_for_age_percentage_children_under_five" will be truncated to "prevalence_of_stunting_height_for_age_percentage_children_under"
NOTICE:  identifier "prevalence_of_wasting_weight_for_height_female_percentage_children_under_five" will be truncated to "prevalence_of_wasting_weight_for_height_female_percentage_child"
NOTICE:  identifier "prevalence_of_wasting_weight_for_height_male_percentage_children_under_five" will be truncated to "prevalence_of_wasting_weight_for_height_male_percentage_childre"
NOTICE:  identifier "prevalence_of_wasting_weight_for_height_percentage_children_under_five" will be truncated to "prevalence_of_wasting_weight_for_height_percentage_children_und"
NOTICE:  identifier "prevalence_of_severe_wasting_weight_for_height_female_percentage_children_under_five" will be truncated to "prevalence_of_severe_wasting_weight_for_height_female_percentag"
NOTICE:  identifier "prevalence_of_severe_wasting_weight_for_height_male_percentage_children_under_five" will be truncated to "prevalence_of_severe_wasting_weight_for_height_male_percentage_"
NOTICE:  identifier "prevalence_of_severe_wasting_weight_for_height_percentage_children_under_five" will be truncated to "prevalence_of_severe_wasting_weight_for_height_percentage_child"
NOTICE:  identifier "vitamin_a_supplementation_coverage_rate_percentage_children_ages_6_to_59_months" will be truncated to "vitamin_a_supplementation_coverage_rate_percentage_children_age"
NOTICE:  identifier "adolescent_fertility_rate_births_per_thousand_women_ages_15_to_19" will be truncated to "adolescent_fertility_rate_births_per_thousand_women_ages_15_to_"
NOTICE:  identifier "contraceptive_prevalence_any_method_percentage_married_women_ages_15_to_49" will be truncated to "contraceptive_prevalence_any_method_percentage_married_women_ag"
*/



create table naturalDisaster_Dimension(
    naturalDisasterEventKey numeric primary key,
    countryKey varchar(50) not null,
    disaster_subgroup varchar(50),
    disaster_type varchar(50),
    disaster_subtype varchar(50),
    disaster_subsubtype varchar(50),
    event_name varchar(100),
    origin varchar(100),
    aid_contribution decimal,
    dis_mag_values decimal,
    dis_mag_scale varchar(50),
    latitude decimal,
    longitude decimal,
    start_month_key numeric,
    end_month_key numeric,
    total_deaths numeric,
    no_injured numeric,
    no_affected numeric,
    no_homeless numeric,
	total_affected numeric,
    reconstruction_costs_000_US_dollars decimal,
	insured_damages_000US numeric,
    total_damages_000_US_dollars decimal,
    cpi decimal,
    FOREIGN key (start_month_key) references month_dimension(monthKey),
    FOREIGN key (end_month_key) references month_dimension(monthKey),
    FOREIGN key (countryKey) references country_dimension(countryKey) ON DELETE CASCADE
);

create table politicalEvent_Dimension(
    politicalEventKey numeric primary key,
    countryKey varchar(50) not null,
    FOREIGN key (countryKey) references country_dimension(countryKey) ON DELETE CASCADE,
    monthKey numeric not null,
    FOREIGN key (monthKey) references month_dimension(monthKey) ON DELETE CASCADE,
    sumEvents numeric,
    totalEvents numeric,
    normalizedEvents1000 decimal,
    eventRootCode numeric,
    eventRootDescr varchar(1000),
    eventCode numeric,
    eventDescr varchar(1000),
    goldsteinScale decimal,
    avgNumMentions decimal,
    sumNumMentions decimal,
    avgAvgTone decimal
);

create table qualityOfLife_Dimension(
    QualityOfLifeKey numeric PRIMARY KEY,
    countryKey varchar(50) not null, 
    FOREIGN key (countryKey) references country_dimension(countryKey) ON DELETE CASCADE,
    monthKey numeric not null, 
    FOREIGN key (monthKey) references month_dimension(monthKey) ON DELETE CASCADE,	
    GNI_per_capita_Atlas_method_current_US decimal,
    female_Mortality_from_CVD_cancer_diabetes_or_CRD_between_exact_ages_30_and_70 decimal,
    male_Mortality_from_CVD_cancer_diabetes_or_CRD_between_exact_ages_30_and_70 decimal,
    Mortality_from_CVD_cancer_diabetes_or_CRD_between_exact_ages_30_and_70 decimal,
    People_using_at_least_basic_drinking_water_services_rural_of_rural_population decimal,
    People_using_at_least_basic_drinking_water_services_urban_of_urban_population decimal,
    People_using_at_least_basic_drinking_water_services_population decimal,
    People_using_safely_managed_drinking_water_services_rural_of_rural_population decimal,
    People_using_safely_managed_drinking_water_services_urban_of_urban_population decimal,
    People_using_safely_managed_drinking_water_services_population decimal,
    Hospital_beds_per_1000_people decimal,
    Nurses_and_midwives_per_1000_people decimal,
    Physicians_per_1000_people decimal,
    Risk_of_catastrophic_expenditure_for_surgical_care_of_people_at_risk decimal,
    Risk_of_impoverishing_expenditure_for_surgical_care_of_people_at_risk decimal,
	People_using_at_least_basic_sanitation_services_of_rural_population decimal,
    People_using_at_least_basic_sanitation_services_of_population decimal,
    rural_People_with_basic_handwashing_facilities_including_soap_and_water_ruralof_rural_population decimal,
    urban_People_with_basic_handwashing_facilities_including_soap_and_water_urban_of_urban_population decimal,
    People_with_basic_handwashing_facilities_including_soap_and_water_of_population decimal,
    People_practicing_open_defecation_rural_of_rural_population decimal,
    People_practicing_open_defecation_urban_of_urban_population decimal,
    People_practicing_open_defecation_of_population decimal,
    Mortality_rate_attribute_to_unintentional_poisoning_per_100000_population decimal,
    Mortality_rate_attribute_to_unintentional_poisoning_female_per_100000_population decimal,
    Mortality_rate_attribute_to_unintentional_poisoning_male_per_100000_population decimal,
    People_using_safely_managed_sanitation_services_rural_of_rural_population decimal,
    People_using_safely_managed_sanitation_services_of_population decimal,
    Suicide_mortality_rate_female_per_100000_female_population decimal,
    Suicide_mortality_rate_male_per_100000_male_population decimal,
    Suicide_mortality_rate_per_100000_population decimal,
    UHC_service_coverage_index decimal,
    Current_health_expenditure_of_GDP decimal,
    Current_health_expenditure_per_capita_current_US decimal,
    Current_health_expenditure_per_capita_PPP_current_international_dollars decimal,
    External_health_expenditure_of_current_health_expenditure decimal,
    External_health_expenditure_channeled_through_government_of_external_health_expenditure decimal,
    External_health_expenditure_per_capita_current_US decimal,
    External_health_expenditure_per_capita_PPP_current_international_dollars decimal,
    Domestic_general_government_health_expenditure_of_current_health_expenditure decimal,
    Domestic_general_government_health_expenditure_of_GDP decimal,
    Domestic_general_government_health_expenditure_of_general_government_expenditure decimal,
    Domestic_general_government_health_expenditure_per_capita_current_US decimal,
    Domestic_general_government_health_expenditure_per_capita_PPP_current_international_dollars decimal,
    Capital_health_expenditure_of_GDP decimal,
    Out_of_pocket_expenditure_of_current_health_expenditure decimal,
    Out_of_pocket_expenditure_per_capita_current_US decimal,
    Out_of_pocket_expenditure_per_capita_PPP_current_international_dollars decimal,
    Domestic_private_health_expenditure_of_current_health_expenditure decimal,
    Domestic_private_health_expenditure_per_capita_current_US decimal,
    Labor_force_female_of_total_labor_force decimal,	
    Labor_force_total decimal
);

/* For quality of life
NOTICE:  identifier "female_mortality_from_cvd_cancer_diabetes_or_crd_between_exact_ages_30_and_70" will be truncated to "female_mortality_from_cvd_cancer_diabetes_or_crd_between_exact_"
NOTICE:  identifier "male_mortality_from_cvd_cancer_diabetes_or_crd_between_exact_ages_30_and_70" will be truncated to "male_mortality_from_cvd_cancer_diabetes_or_crd_between_exact_ag"
NOTICE:  identifier "mortality_from_cvd_cancer_diabetes_or_crd_between_exact_ages_30_and_70" will be truncated to "mortality_from_cvd_cancer_diabetes_or_crd_between_exact_ages_30"
NOTICE:  identifier "people_using_at_least_basic_drinking_water_services_rural_of_rural_population" will be truncated to "people_using_at_least_basic_drinking_water_services_rural_of_ru"
NOTICE:  identifier "people_using_at_least_basic_drinking_water_services_urban_of_urban_population" will be truncated to "people_using_at_least_basic_drinking_water_services_urban_of_ur"
NOTICE:  identifier "people_using_safely_managed_drinking_water_services_rural_of_rural_population" will be truncated to "people_using_safely_managed_drinking_water_services_rural_of_ru"
NOTICE:  identifier "people_using_safely_managed_drinking_water_services_urban_of_urban_population" will be truncated to "people_using_safely_managed_drinking_water_services_urban_of_ur"
NOTICE:  identifier "risk_of_catastrophic_expenditure_for_surgical_care_of_people_at_risk" will be truncated to "risk_of_catastrophic_expenditure_for_surgical_care_of_people_at"
NOTICE:  identifier "risk_of_impoverishing_expenditure_for_surgical_care_of_people_at_risk" will be truncated to "risk_of_impoverishing_expenditure_for_surgical_care_of_people_a"
NOTICE:  identifier "rural_people_with_basic_handwashing_facilities_including_soap_and_water_ruralof_rural_population" will be truncated to "rural_people_with_basic_handwashing_facilities_including_soap_a"
NOTICE:  identifier "urban_people_with_basic_handwashing_facilities_including_soap_and_water_urban_of_urban_population" will be truncated to "urban_people_with_basic_handwashing_facilities_including_soap_a"
NOTICE:  identifier "people_with_basic_handwashing_facilities_including_soap_and_water_of_population" will be truncated to "people_with_basic_handwashing_facilities_including_soap_and_wat"
NOTICE:  identifier "mortality_rate_attribute_to_unintentional_poisoning_per_100000_population" will be truncated to "mortality_rate_attribute_to_unintentional_poisoning_per_100000_"
NOTICE:  identifier "mortality_rate_attribute_to_unintentional_poisoning_female_per_100000_population" will be truncated to "mortality_rate_attribute_to_unintentional_poisoning_female_per_"
NOTICE:  identifier "mortality_rate_attribute_to_unintentional_poisoning_male_per_100000_population" will be truncated to "mortality_rate_attribute_to_unintentional_poisoning_male_per_10"
NOTICE:  identifier "people_using_safely_managed_sanitation_services_rural_of_rural_population" will be truncated to "people_using_safely_managed_sanitation_services_rural_of_rural_"
NOTICE:  identifier "current_health_expenditure_per_capita_ppp_current_international_dollars" will be truncated to "current_health_expenditure_per_capita_ppp_current_international"
NOTICE:  identifier "external_health_expenditure_channeled_through_government_of_external_health_expenditure" will be truncated to "external_health_expenditure_channeled_through_government_of_ext"
NOTICE:  identifier "external_health_expenditure_per_capita_ppp_current_international_dollars" will be truncated to "external_health_expenditure_per_capita_ppp_current_internationa"
NOTICE:  identifier "domestic_general_government_health_expenditure_of_current_health_expenditure" will be truncated to "domestic_general_government_health_expenditure_of_current_healt"
NOTICE:  identifier "domestic_general_government_health_expenditure_of_general_government_expenditure" will be truncated to "domestic_general_government_health_expenditure_of_general_gover"
NOTICE:  identifier "domestic_general_government_health_expenditure_per_capita_current_us" will be truncated to "domestic_general_government_health_expenditure_per_capita_curre"
NOTICE:  identifier "domestic_general_government_health_expenditure_per_capita_ppp_current_international_dollars" will be truncated to "domestic_general_government_health_expenditure_per_capita_ppp_c"
NOTICE:  identifier "out_of_pocket_expenditure_per_capita_ppp_current_international_dollars" will be truncated to "out_of_pocket_expenditure_per_capita_ppp_current_international_"
NOTICE:  identifier "domestic_private_health_expenditure_of_current_health_expenditure" will be truncated to "domestic_private_health_expenditure_of_current_health_expenditu"
*/

create table population_dimension(
    populationKey numeric PRIMARY KEY,
    countryKey varchar(50) not null,
    FOREIGN key (countryKey) references country_dimension(countryKey) ON DELETE CASCADE,
    monthKey numeric,
    FOREIGN key (monthKey) references month_dimension(monthKey),
    Number_of_deaths_ages_5_9_years decimal,
    Number_of_deaths_ages_10_14_years decimal,
    Number_of_deaths_ages_15_19_years decimal,
    Number_of_deaths_ages_20_24_years decimal,
    Number_of_infant_deaths decimal,
    Number_of_infant_deaths_female decimal,
    Number_of_infant_deaths_male decimal,
    Number_of_under_five_deaths decimal,
    Number_of_under_five_deaths_female decimal,
    Number_of_under_five_deaths_male decimal,
    Number_of_neonatal_deaths decimal,
    Number_of_stillbirths decimal,
    Probability_of_dying_among_children_ages_5_9_years_per_1_000 decimal,
    Probability_of_dying_among_adolescents_ages_10_14_years_per_1_000 decimal,
    Probability_of_dying_among_adolescents_ages_15_19_years_per_1_000 decimal,
    Probability_of_dying_among_youth_ages_20_24_years_per_1_000 decimal,
    Mortality_rate_neonatal_per_1_000_live_births decimal,
    Stillbirth_rate_per_1_000_total_births decimal,
    Mortality_rate_adult_female_per_1_000_female_adults decimal,
    Mortality_rate_adult_male_per_1_000_male_adults decimal,
    Birth_rate_crude_per_1_000_people decimal,
    Death_rate_crude_per_1_000_people decimal,
    Mortality_rate_infant_female_per_1_000_live_births decimal,
    Mortality_rate_infant_per_1_000_live_births decimal,
    Mortality_rate_infant_male_per_1_000_live_births decimal,
    Life_expectancy_at_birth_female_years decimal,
    Life_expectancy_at_birth_total_years decimal,
    Life_expectancy_at_birth_male_years decimal,
    Fertility_rate_total_births_per_woman decimal,
    Survival_to_age_65_female_of_cohort decimal,
    Survival_to_age_65_male_of_cohort decimal,
    Population_ages_00_04_female decimal,
    Population_ages_00_04_female_of_female_population decimal,
    Population_ages_00_04_male decimal,
    Population_ages_00_04_male_of_male_population decimal,
    Population_ages_0_14_female decimal,
    Population_ages_0_14_female_of_female_population decimal,
    Population_ages_0_14_male decimal,
    Population_ages_0_14_male_of_male_population decimal,
    Population_ages_0_14_of_total_population decimal,
    Population_ages_05_09_female decimal,
    Population_ages_05_09_female_of_female_population decimal,
    Population_ages_05_09_male decimal,
    Population_ages_05_09_male_of_male_population decimal,
    Population_ages_10_14_female decimal,
    Population_ages_10_14_female_of_female_population decimal,
    Population_ages_10_14_male decimal,
    Population_ages_10_14_male_of_male_population decimal,
    Population_ages_15_19_female decimal,
    Population_ages_15_19_female_of_female_population decimal,
    Population_ages_15_19_male decimal,
    Population_ages_15_19_male_of_male_population decimal,
    Population_ages_15_64_female decimal,
    Population_ages_15_64_female_of_female_population decimal,
    Population_ages_15_64_male decimal,
    Population_ages_15_64_male_of_male_population decimal,
    Population_ages_15_64_total decimal,
    Population_ages_15_64_of_total_population decimal,
    Population_ages_20_24_female decimal,
    Population_ages_20_24_female_of_female_population decimal,
    Population_ages_20_24_male decimal,
    Population_ages_20_24_male_of_male_population decimal,
    Population_ages_25_29_female decimal,
    Population_ages_25_29_female_of_female_population decimal,
    Population_ages_25_29_male decimal,
    Population_ages_25_29_male_of_male_population decimal,
    Population_ages_30_34_female decimal,
    Population_ages_30_34_female_of_female_population decimal,
    Population_ages_30_34_male decimal,
    Population_ages_30_34_male_of_male_population decimal,
    Population_ages_35_39_female decimal,
    Population_ages_35_39_female_of_female_population decimal,
    Population_ages_35_39_male decimal,
    Population_ages_35_39_male_of_male_population decimal,
    Population_ages_40_44_female decimal,
    Population_ages_40_44_female_of_female_population decimal,
    Population_ages_40_44_male decimal,
    Population_ages_40_44_male_of_male_population decimal,
    Population_ages_45_49_female decimal,
    Population_ages_45_49_female_of_female_population decimal,
    Population_ages_45_49_male decimal,
    Population_ages_45_49_male_of_male_population decimal,
    Population_ages_50_54_female decimal,
    Population_ages_50_54_female_of_female_population decimal,
    Population_ages_50_54_male decimal,
    Population_ages_50_54_male_of_male_population decimal,
    Population_ages_55_59_female decimal,
    Population_ages_55_59_female_of_female_population decimal,
    Population_ages_55_59_male decimal,
    Population_ages_55_59_male_of_male_population decimal,
    Population_ages_60_64_female decimal,
    Population_ages_60_64_female_of_female_population decimal,
    Population_ages_60_64_male decimal,
    Population_ages_60_64_male_of_male_population decimal,
    Population_ages_65_69_female decimal,
    Population_ages_65_69_female_of_female_population decimal,
    Population_ages_65_69_male decimal,
    Population_ages_65_69_male_of_male_population decimal,
    Population_ages_65_and_above_female decimal,
    Population_ages_65_and_above_female_of_female_population decimal,
    Population_ages_65_and_above_male decimal,
    Population_ages_65_and_above_male_of_male_population decimal,
    Population_ages_65_and_above_total decimal,
    Population_ages_65_and_above_of_total_population decimal,
    Population_ages_70_74_female decimal,
    Population_ages_70_74_female_of_female_population decimal,
    Population_ages_70_74_male decimal,
    Population_ages_70_74_male_of_male_population decimal,
    Population_ages_75_79_female decimal,
    Population_ages_75_79_female_of_female_population decimal,
    Population_ages_75_79_male decimal,
    Population_ages_75_79_male_of_male_population decimal,
    Population_ages_80_and_above_female decimal,
    Population_ages_80_and_above_male decimal,
    Population_ages_80_and_above_male_of_male_population decimal,
    Age_population_age_00_female_interpolated decimal,
    Age_population_age_00_male_interpolated decimal,
    Age_population_age_01_female_interpolated decimal,
    Age_population_age_01_male_interpolated decimal,
    Age_population_age_02_female_interpolated decimal,
    Age_population_age_02_male_interpolated decimal,
    Age_population_age_03_female_interpolated decimal,
    Age_population_age_03_male_interpolated decimal,
    Age_population_age_04_female_interpolated decimal,
    Age_population_age_04_male_interpolated decimal,
    Age_population_age_05_female_interpolated decimal,
    Age_population_age_05_male_interpolated decimal,
    Age_population_age_06_female_interpolated decimal,
    Age_population_age_06_male_interpolated decimal,
    Age_population_age_07_female_interpolated decimal,
    Age_population_age_07_male_interpolated decimal,
    Age_population_age_08_female_interpolated decimal,
    Age_population_age_08_male_interpolated decimal,
    Age_population_age_09_female_interpolated decimal,
    Age_population_age_09_male_interpolated decimal,
    Age_population_age_10_female_interpolated decimal,
    Age_population_age_10_male_interpolated decimal,
    Age_population_age_11_female_interpolated decimal,
    Age_population_age_11_male_interpolated decimal,
    Age_population_age_12_female_interpolated decimal,
    Age_population_age_12_male_interpolated decimal,
    Age_population_age_13_female_interpolated decimal,
    Age_population_age_13_male_interpolated decimal,
    Age_population_age_14_female_interpolated decimal,
    Age_population_age_14_male_interpolated decimal,
    Age_population_age_15_female_interpolated decimal,
    Age_population_age_15_male_interpolated decimal,
    Age_population_age_16_female_interpolated decimal,
    Age_population_age_16_male_interpolated decimal,
    Age_population_age_17_female_interpolated decimal,
    Age_population_age_17_male_interpolated decimal,
    Age_population_age_18_female_interpolated decimal,
    Age_population_age_18_male_interpolated decimal,
    Age_population_age_19_female_interpolated decimal,
    Age_population_age_19_male_interpolated decimal,
    Age_population_age_20_female_interpolated decimal,
    Age_population_age_20_male_interpolated decimal,
    Age_population_age_21_female_interpolated decimal,
    Age_population_age_21_male_interpolated decimal,
    Age_population_age_22_female_interpolated decimal,
    Age_population_age_22_male_interpolated decimal,
    Age_population_age_23_female_interpolated decimal,
    Age_population_age_23_male_interpolated decimal,
    Age_population_age_24_female_interpolated decimal,
    Age_population_age_24_male_interpolated decimal,
    Age_population_age_25_female_interpolated decimal,
    Age_population_age_25_male_interpolated decimal,
    Sex_ratio_at_birth_male_births_per_female_births decimal,
    Age_dependency_ratio_of_working_age_population decimal,
    Population_growth_annual decimal,
    Population_total decimal,
    Population_female decimal,
    Population_female_of_total_population decimal,
    Population_male decimal,
    Population_male_of_total_population decimal,
    Rural_population decimal,
    Rural_population_growth_annual decimal,
    Rural_population_of_total_population decimal,
    Urban_population_growth_annual decimal,
    Urban_population decimal,
    Urban_population_of_total_population decimal
);
/*  for  population_dimension
NOTICE:  identifier "probability_of_dying_among_adolescents_ages_10_14_years_per_1_000" will be truncated to "probability_of_dying_among_adolescents_ages_10_14_years_per_1_0"
NOTICE:  identifier "probability_of_dying_among_adolescents_ages_15_19_years_per_1_000" will be truncated to "probability_of_dying_among_adolescents_ages_15_19_years_per_1_0"
*/


create table fact_table(
    factTableKey numeric Primary key,
    countryKey varchar(50) not null,
    FOREIGN key (countryKey) references country_dimension(countryKey) ON DELETE CASCADE,
    monthKey numeric,
    FOREIGN key (monthKey) references month_dimension(monthKey),
    Month numeric,
    Quarter numeric,
    Year numeric,
    Decade varchar(1000),
    Table_Name varchar(1000),
    Long_Name varchar(1000),
    Region varchar(1000),
    Currency_Unit varchar(1000),
    Income_Group varchar(1000),
    System_of_trade varchar(1000),
    Government_Accounting_concept varchar(1000),
    Lending_category varchar(1000),
    Continent varchar(1000),
    Capital varchar(1000),
    Total_Population decimal,
    Human_Development_Index decimal,
    Quality_of_Life_Index decimal,
    Development_Index numeric,
    HealthKey decimal,
    Total_alcohol_consumption_per_capita_female_liters_of_pure_alcohol_projected_estimates_female_15_years_of_age decimal,
    Total_alcohol_consumption_per_capita_liters_of_pure_alcohol_projected_estimates_15_years_of_age decimal,
    Total_alcohol_consumption_per_capita_male_liters_of_pure_alcohol_projected_estimates_male_15_years_of_age decimal,
    Prevalence_of_anemia_among_women_of_reproductive_age_of_women_ages_15_49 decimal,
    Prevalence_of_anemia_among_children_of_children_ages_6_59_months decimal,
    Prevalence_of_anemia_among_non_pregnant_women_of_women_ages_15_49 decimal,
    Adults_ages_15_living_with_HIV decimal,
    AIDS_estimated_deaths_UNAIDS_estimates decimal,
    Women_s_share_of_population_ages_15_living_with_HIV decimal,
    Prevalence_of_HIV_total_of_population_ages_15_49 decimal,
    Children_0_14_living_with_HIV decimal,
    Prevalence_of_HIV_female_ages_15_24 decimal,
    Prevalence_of_HIV_male_ages_15_24 decimal,
    Antiretroviral_therapy_coverage_of_people_living_with_HIV decimal,
    Adults_ages_15_49_newly_infected_with_HIV decimal,
    Children_ages_0_14_newly_infected_with_HIV decimal,
    Incidence_of_HIV_ages_50_per_1_000_uninfected_population_ages_50 decimal,
    Adults_ages_15_and_children_ages_0_14_newly_infected_with_HIV decimal,
    Incidence_of_HIV_all_per_1_000_uninfected_population decimal,
    Young_people_ages_15_24_newly_infected_with_HIV decimal,
    Incidence_of_HIV_ages_15_24_per_1_000_uninfected_population_ages_15_24 decimal,
    Incidence_of_HIV_ages_15_49_per_1_000_uninfected_population_ages_15_49 decimal,
    Children_orphaned_by_HIV_AIDS decimal,
    Antiretroviral_therapy_coverage_for_PMTCT_of_pregnant_women_living_with_HIV decimal,
    Adults_ages_15_and_children_0_14_years_living_with_HIV decimal,
    Immunization_HepB3_of_one_year_old_children decimal,
    Immunization_Hib3_of_children_ages_12_23_months decimal,
    Immunization_BCG_of_one_year_old_children decimal,
    Immunization_DPT_of_children_ages_12_23_months decimal,
    Immunization_measles_second_dose_of_children_by_the_nationally_recommended_age decimal,
    Immunization_measles_of_children_ages_12_23_months decimal,
    Immunization_Pol3_of_one_year_old_children decimal,
    Incidence_of_malaria_per_1_000_population_at_risk decimal,
    Number_of_maternal_deaths decimal,
    Lifetime_risk_of_maternal_death_1_in_rate_varies_by_country decimal,
    Lifetime_risk_of_maternal_death decimal,
    Prevalence_of_anemia_among_pregnant_women decimal,
    Prevalence_of_syphilis_of_women_attending_antenatal_care decimal,
    Prevalence_of_current_tobacco_use_of_adults decimal,
    Prevalence_of_current_tobacco_use_females_of_female_adults decimal,
    Prevalence_of_current_tobacco_use_males_of_male_adults decimal,
    Births_attended_by_skilled_health_staff_of_total decimal,
    Low_birthweight_babies_of_births decimal,
    Prevalence_of_underweight_weight_for_age_female_of_children_under_5 decimal,
    Prevalence_of_underweight_weight_for_age_male_of_children_under_5 decimal,
    Prevalence_of_underweight_weight_for_age_of_children_under_5 decimal,
    Malaria_cases_reported decimal,
    Maternal_mortality_ratio_modeled_estimate_per_100_000_live_births decimal,
    Maternal_mortality_ratio_national_estimate_per_100_000_live_births decimal,
    Prevalence_of_overweight_female_of_female_adults decimal,
    Prevalence_of_overweight_male_of_male_adults decimal,
    Prevalence_of_overweight_of_adults decimal,
    Prevalence_of_stunting_height_for_age_female_of_children_under_5 decimal,
    Prevalence_of_stunting_height_for_age_male_of_children_under_5 decimal,
    Prevalence_of_stunting_height_for_age_of_children_under_5 decimal,
    Prevalence_of_wasting_weight_for_height_female_of_children_under_5 decimal,
    Prevalence_of_wasting_weight_for_height_male_of_children_under_5 decimal,
    Prevalence_of_wasting_weight_for_height_of_children_under_5 decimal,
    Prevalence_of_severe_wasting_weight_for_height_female_of_children_under_5 decimal,
    Prevalence_of_severe_wasting_weight_for_height_male_of_children_under_5 decimal,
    Prevalence_of_severe_wasting_weight_for_height_of_children_under_5 decimal,
    Tuberculosis_treatment_success_rate_of_new_cases decimal,
    Tuberculosis_case_detection_rate_all_forms decimal,
    Incidence_of_tuberculosis_per_100_000_people decimal,
    Tuberculosis_death_rate_per_100_000_people decimal,
    Newborns_protected_against_tetanus decimal,
    Number_of_people_who_are_undernourished decimal,
    Prevalence_of_undernourishment_of_population decimal,
    Vitamin_A_supplementation_coverage_rate_of_children_ages_6_59_months decimal,
    Adolescent_fertility_rate_births_per_1_000_women_ages_15_19 decimal,
    Contraceptive_prevalence_any_method_of_married_women_ages_15_49 decimal,
    PopulationKey decimal,
    Number_of_deaths_ages_5_9_years decimal,
    Number_of_deaths_ages_10_14_years decimal,
    Number_of_deaths_ages_15_19_years decimal,
    Number_of_deaths_ages_20_24_years decimal,
    Number_of_infant_deaths decimal,
    Number_of_infant_deaths_female decimal,
    Number_of_infant_deaths_male decimal,
    Number_of_under_five_deaths decimal,
    Number_of_under_five_deaths_female decimal,
    Number_of_under_five_deaths_male decimal,
    Number_of_neonatal_deaths decimal,
    Number_of_stillbirths decimal,
    Probability_of_dying_among_children_ages_5_9_years_per_1_000 decimal,
    Probability_of_dying_among_adolescents_ages_10_14_years_per_1_000 decimal,
    Probability_of_dying_among_adolescents_ages_15_19_years_per_1_000 decimal,
    Probability_of_dying_among_youth_ages_20_24_years_per_1_000 decimal,
    Mortality_rate_neonatal_per_1_000_live_births decimal,
    Stillbirth_rate_per_1_000_total_births decimal,
    Mortality_rate_adult_female_per_1_000_female_adults decimal,
    Mortality_rate_adult_male_per_1_000_male_adults decimal,
    Birth_rate_crude_per_1_000_people decimal,
    Death_rate_crude_per_1_000_people decimal,
    Mortality_rate_infant_female_per_1_000_live_births decimal,
    Mortality_rate_infant_per_1_000_live_births decimal,
    Mortality_rate_infant_male_per_1_000_live_births decimal,
    Life_expectancy_at_birth_female_years decimal,
    Life_expectancy_at_birth_total_years decimal,
    Life_expectancy_at_birth_male_years decimal,
    Fertility_rate_total_births_per_woman decimal,
    Survival_to_age_65_female_of_cohort decimal,
    Survival_to_age_65_male_of_cohort decimal,
    Population_ages_00_04_female decimal,
    Population_ages_00_04_female_of_female_population decimal,
    Population_ages_00_04_male decimal,
    Population_ages_00_04_male_of_male_population decimal,
    Population_ages_0_14_female decimal,
    Population_ages_0_14_female_of_female_population decimal,
    Population_ages_0_14_male decimal,
    Population_ages_0_14_male_of_male_population decimal,
    Population_ages_0_14_of_total_population decimal,
    Population_ages_05_09_female decimal,
    Population_ages_05_09_female_of_female_population decimal,
    Population_ages_05_09_male decimal,
    Population_ages_05_09_male_of_male_population decimal,
    Population_ages_10_14_female decimal,
    Population_ages_10_14_female_of_female_population decimal,
    Population_ages_10_14_male decimal,
    Population_ages_10_14_male_of_male_population decimal,
    Population_ages_15_19_female decimal,
    Population_ages_15_19_female_of_female_population decimal,
    Population_ages_15_19_male decimal,
    Population_ages_15_19_male_of_male_population decimal,
    Population_ages_15_64_female decimal,
    Population_ages_15_64_female_of_female_population decimal,
    Population_ages_15_64_male decimal,
    Population_ages_15_64_male_of_male_population decimal,
    Population_ages_15_64_total decimal,
    Population_ages_15_64_of_total_population decimal,
    Population_ages_20_24_female decimal,
    Population_ages_20_24_female_of_female_population decimal,
    Population_ages_20_24_male decimal,
    Population_ages_20_24_male_of_male_population decimal,
    Population_ages_25_29_female decimal,
    Population_ages_25_29_female_of_female_population decimal,
    Population_ages_25_29_male decimal,
    Population_ages_25_29_male_of_male_population decimal,
    Population_ages_30_34_female decimal,
    Population_ages_30_34_female_of_female_population decimal,
    Population_ages_30_34_male decimal,
    Population_ages_30_34_male_of_male_population decimal,
    Population_ages_35_39_female decimal,
    Population_ages_35_39_female_of_female_population decimal,
    Population_ages_35_39_male decimal,
    Population_ages_35_39_male_of_male_population decimal,
    Population_ages_40_44_female decimal,
    Population_ages_40_44_female_of_female_population decimal,
    Population_ages_40_44_male decimal,
    Population_ages_40_44_male_of_male_population decimal,
    Population_ages_45_49_female decimal,
    Population_ages_45_49_female_of_female_population decimal,
    Population_ages_45_49_male decimal,
    Population_ages_45_49_male_of_male_population decimal,
    Population_ages_50_54_female decimal,
    Population_ages_50_54_female_of_female_population decimal,
    Population_ages_50_54_male decimal,
    Population_ages_50_54_male_of_male_population decimal,
    Population_ages_55_59_female decimal,
    Population_ages_55_59_female_of_female_population decimal,
    Population_ages_55_59_male decimal,
    Population_ages_55_59_male_of_male_population decimal,
    Population_ages_60_64_female decimal,
    Population_ages_60_64_female_of_female_population decimal,
    Population_ages_60_64_male decimal,
    Population_ages_60_64_male_of_male_population decimal,
    Population_ages_65_69_female decimal,
    Population_ages_65_69_female_of_female_population decimal,
    Population_ages_65_69_male decimal,
    Population_ages_65_69_male_of_male_population decimal,
    Population_ages_65_and_above_female decimal,
    Population_ages_65_and_above_female_of_female_population decimal,
    Population_ages_65_and_above_male decimal,
    Population_ages_65_and_above_male_of_male_population decimal,
    Population_ages_65_and_above_total decimal,
    Population_ages_65_and_above_of_total_population decimal,
    Population_ages_70_74_female decimal,
    Population_ages_70_74_female_of_female_population decimal,
    Population_ages_70_74_male decimal,
    Population_ages_70_74_male_of_male_population decimal,
    Population_ages_75_79_female decimal,
    Population_ages_75_79_female_of_female_population decimal,
    Population_ages_75_79_male decimal,
    Population_ages_75_79_male_of_male_population decimal,
    Population_ages_80_and_above_female decimal,
    Population_ages_80_and_above_male decimal,
    Population_ages_80_and_above_male_of_male_population decimal,
    Age_population_age_00_female_interpolated decimal,
    Age_population_age_00_male_interpolated decimal,
    Age_population_age_01_female_interpolated decimal,
    Age_population_age_01_male_interpolated decimal,
    Age_population_age_02_female_interpolated decimal,
    Age_population_age_02_male_interpolated decimal,
    Age_population_age_03_female_interpolated decimal,
    Age_population_age_03_male_interpolated decimal,
    Age_population_age_04_female_interpolated decimal,
    Age_population_age_04_male_interpolated decimal,
    Age_population_age_05_female_interpolated decimal,
    Age_population_age_05_male_interpolated decimal,
    Age_population_age_06_female_interpolated decimal,
    Age_population_age_06_male_interpolated decimal,
    Age_population_age_07_female_interpolated decimal,
    Age_population_age_07_male_interpolated decimal,
    Age_population_age_08_female_interpolated decimal,
    Age_population_age_08_male_interpolated decimal,
    Age_population_age_09_female_interpolated decimal,
    Age_population_age_09_male_interpolated decimal,
    Age_population_age_10_female_interpolated decimal,
    Age_population_age_10_male_interpolated decimal,
    Age_population_age_11_female_interpolated decimal,
    Age_population_age_11_male_interpolated decimal,
    Age_population_age_12_female_interpolated decimal,
    Age_population_age_12_male_interpolated decimal,
    Age_population_age_13_female_interpolated decimal,
    Age_population_age_13_male_interpolated decimal,
    Age_population_age_14_female_interpolated decimal,
    Age_population_age_14_male_interpolated decimal,
    Age_population_age_15_female_interpolated decimal,
    Age_population_age_15_male_interpolated decimal,
    Age_population_age_16_female_interpolated decimal,
    Age_population_age_16_male_interpolated decimal,
    Age_population_age_17_female_interpolated decimal,
    Age_population_age_17_male_interpolated decimal,
    Age_population_age_18_female_interpolated decimal,
    Age_population_age_18_male_interpolated decimal,
    Age_population_age_19_female_interpolated decimal,
    Age_population_age_19_male_interpolated decimal,
    Age_population_age_20_female_interpolated decimal,
    Age_population_age_20_male_interpolated decimal,
    Age_population_age_21_female_interpolated decimal,
    Age_population_age_21_male_interpolated decimal,
    Age_population_age_22_female_interpolated decimal,
    Age_population_age_22_male_interpolated decimal,
    Age_population_age_23_female_interpolated decimal,
    Age_population_age_23_male_interpolated decimal,
    Age_population_age_24_female_interpolated decimal,
    Age_population_age_24_male_interpolated decimal,
    Age_population_age_25_female_interpolated decimal,
    Age_population_age_25_male_interpolated decimal,
    Sex_ratio_at_birth_male_births_per_female_births decimal,
    Age_dependency_ratio_of_working_age_population decimal,
    Population_growth_annual decimal,
    Population_total decimal,
    Population_female decimal,
    Population_female_of_total_population decimal,
    Population_male decimal,
    Population_male_of_total_population decimal,
    Rural_population decimal,
    Rural_population_growth_annual decimal,
    Rural_population_of_total_population decimal,
    Urban_population_growth_annual decimal,
    Urban_population decimal,
    Urban_population_of_total_population decimal,
    QualityOfLifeKey decimal,
    GNI_per_capita_Atlas_method_current_US decimal,
    female_Mortality_from_CVD_cancer_diabetes_or_CRD_between_exact_ages_30_and_70 decimal,
    male_Mortality_from_CVD_cancer_diabetes_or_CRD_between_exact_ages_30_and_70 decimal,
    Mortality_from_CVD_cancer_diabetes_or_CRD_between_exact_ages_30_and_70 decimal,
    People_using_at_least_basic_drinking_water_services_rural_of_rural_population decimal,
    People_using_at_least_basic_drinking_water_services_urban_of_urban_population decimal,
    People_using_at_least_basic_drinking_water_services_of_population decimal,
    People_using_safely_managed_drinking_water_services_rural_of_rural_population decimal,
    People_using_safely_managed_drinking_water_services_urban_of_urban_population decimal,
    People_using_safely_managed_drinking_water_services_of_population decimal,
    Hospital_beds_per_1_000_people decimal,
    Nurses_and_midwives_per_1_000_people decimal,
    Physicians_per_1_000_people decimal,
    Risk_of_catastrophic_expenditure_for_surgical_care_of_people_at_risk decimal,
    Risk_of_impoverishing_expenditure_for_surgical_care_of_people_at_risk decimal,
    People_using_at_least_basic_sanitation_services_rural_of_rural_population decimal,
    People_using_at_least_basic_sanitation_services_of_population decimal,
    rural_People_with_basic_handwashing_facilities_including_soap_and_water_rural_of_rural_population decimal,
    urban_People_with_basic_handwashing_facilities_including_soap_and_water_urban_of_urban_population decimal,
    People_with_basic_handwashing_facilities_including_soap_and_water_of_population decimal,
    People_practicing_open_defecation_rural_of_rural_population decimal,
    People_practicing_open_defecation_urban_of_urban_population decimal,
    People_practicing_open_defecation_of_population decimal,
    Mortality_rate_attributed_to_unintentional_poisoning_per_100_000_population decimal,
    Mortality_rate_attributed_to_unintentional_poisoning_female_per_100_000_female_population decimal,
    Mortality_rate_attributed_to_unintentional_poisoning_male_per_100_000_male_population decimal,
    People_using_safely_managed_sanitation_services_rural_of_rural_population decimal,
    People_using_safely_managed_sanitation_services_of_population decimal,
    Suicide_mortality_rate_female_per_100_000_female_population decimal,
    Suicide_mortality_rate_male_per_100_000_male_population decimal,
    Suicide_mortality_rate_per_100_000_population decimal,
    UHC_service_coverage_index decimal,
    Current_health_expenditure_of_GDP decimal,
    Current_health_expenditure_per_capita_current_US decimal,
    Current_health_expenditure_per_capita_PPP_current_international decimal,
    External_health_expenditure_of_current_health_expenditure decimal,
    External_health_expenditure_channeled_through_government_of_external_health_expenditure decimal,
    External_health_expenditure_per_capita_current_US decimal,
    External_health_expenditure_per_capita_PPP_current_international decimal,
    Domestic_general_government_health_expenditure_of_current_health_expenditure decimal,
    Domestic_general_government_health_expenditure_of_GDP decimal,
    Domestic_general_government_health_expenditure_of_general_government_expenditure decimal,
    Domestic_general_government_health_expenditure_per_capita_current_US decimal,
    Domestic_general_government_health_expenditure_per_capita_PPP_current_international decimal,
    Capital_health_expenditure_of_GDP decimal,
    Out_of_pocket_expenditure_of_current_health_expenditure decimal,
    Out_of_pocket_expenditure_per_capita_current_US decimal,
    Out_of_pocket_expenditure_per_capita_PPP_current_international decimal,
    Domestic_private_health_expenditure_of_current_health_expenditure decimal,
    Domestic_private_health_expenditure_per_capita_current_US decimal,
    Labor_force_female_of_total_labor_force decimal,
    Labor_force_total decimal,
    EducationKey decimal,
    Literacy_rate_youth_male_of_males_ages_15_24 decimal,
    Literacy_rate_youth_total_of_people_ages_15_24 decimal,
    Literacy_rate_adult_female_of_females_ages_15_and_above decimal,
    Literacy_rate_adult_male_of_males_ages_15_and_above decimal,
    Literacy_rate_adult_total_of_people_ages_15_and_above decimal,
    Primary_completion_rate_female_of_relevant_age_group decimal,
    Primary_completion_rate_male_of_relevant_age_group decimal,
    Primary_completion_rate_total_of_relevant_age_group decimal,
    School_enrollment_primary_gross decimal,
    School_enrollment_primary_female_gross decimal,
    School_enrollment_primary_male_gross decimal,
    School_enrollment_primary_net decimal,
    School_enrollment_primary_female_net decimal,
    School_enrollment_primary_male_net decimal,
    School_enrollment_secondary_gross decimal,
    School_enrollment_secondary_female_gross decimal,
    School_enrollment_secondary_male_gross decimal,
    School_enrollment_secondary_net decimal,
    School_enrollment_secondary_female_net decimal,
    School_enrollment_secondary_male_net decimal,
    School_enrollment_tertiary_gross decimal,
    School_enrollment_tertiary_female_gross decimal,
    PoliticalEventKey decimal,
    SumEvents decimal,
    TotalEvents decimal,
    NormalizedEvents1000 decimal,
    EventRootCode decimal,
    EventRootDescr varchar(1000),
    EventCode decimal,
    EventDescr varchar(1000),
    GoldsteinScale decimal,
    AvgNumMentions decimal,
    SumNumMentions decimal,
    AvgAvgTone decimal,
    NaturalDisasterEventKey decimal,
    Disaster_Subgroup varchar(1000),
    Disaster_Type varchar(1000),
    Disaster_Subtype varchar(1000),
    Disaster_Subsubtype varchar(1000),
    Event_Name varchar(1000),
    Origin varchar(1000),
    Aid_Contribution decimal,
    Dis_Mag_Value decimal,
    Dis_Mag_Scale varchar(1000),
    Latitude decimal,
    Longitude decimal,
    StartMonthKey decimal,
    EndMonthKey decimal,
    Total_Deaths decimal,
    No_Injured decimal,
    No_Affected decimal,
    No_Homeless decimal,
    Total_Affected decimal,
    Reconstruction_Costs_000_US decimal,
    Insured_Damages_000_US decimal,
    Total_Damages_000_US decimal,
    CPI decimal
);
/* For fact table
NOTICE:  identifier "total_alcohol_consumption_per_capita_female_liters_of_pure_alcohol_projected_estimates_female_15_years_of_age" will be truncated to "total_alcohol_consumption_per_capita_female_liters_of_pure_alco"
NOTICE:  identifier "total_alcohol_consumption_per_capita_liters_of_pure_alcohol_projected_estimates_15_years_of_age" will be truncated to "total_alcohol_consumption_per_capita_liters_of_pure_alcohol_pro"
NOTICE:  identifier "total_alcohol_consumption_per_capita_male_liters_of_pure_alcohol_projected_estimates_male_15_years_of_age" will be truncated to "total_alcohol_consumption_per_capita_male_liters_of_pure_alcoho"
NOTICE:  identifier "prevalence_of_anemia_among_women_of_reproductive_age_of_women_ages_15_49" will be truncated to "prevalence_of_anemia_among_women_of_reproductive_age_of_women_a"
NOTICE:  identifier "prevalence_of_anemia_among_children_of_children_ages_6_59_months" will be truncated to "prevalence_of_anemia_among_children_of_children_ages_6_59_month"
NOTICE:  identifier "prevalence_of_anemia_among_non_pregnant_women_of_women_ages_15_49" will be truncated to "prevalence_of_anemia_among_non_pregnant_women_of_women_ages_15_"
NOTICE:  identifier "incidence_of_hiv_ages_50_per_1_000_uninfected_population_ages_50" will be truncated to "incidence_of_hiv_ages_50_per_1_000_uninfected_population_ages_5"
NOTICE:  identifier "incidence_of_hiv_ages_15_24_per_1_000_uninfected_population_ages_15_24" will be truncated to "incidence_of_hiv_ages_15_24_per_1_000_uninfected_population_age"
NOTICE:  identifier "incidence_of_hiv_ages_15_49_per_1_000_uninfected_population_ages_15_49" will be truncated to "incidence_of_hiv_ages_15_49_per_1_000_uninfected_population_age"
NOTICE:  identifier "antiretroviral_therapy_coverage_for_pmtct_of_pregnant_women_living_with_hiv" will be truncated to "antiretroviral_therapy_coverage_for_pmtct_of_pregnant_women_liv"
NOTICE:  identifier "immunization_measles_second_dose_of_children_by_the_nationally_recommended_age" will be truncated to "immunization_measles_second_dose_of_children_by_the_nationally_"
NOTICE:  identifier "prevalence_of_underweight_weight_for_age_female_of_children_under_5" will be truncated to "prevalence_of_underweight_weight_for_age_female_of_children_und"
NOTICE:  identifier "prevalence_of_underweight_weight_for_age_male_of_children_under_5" will be truncated to "prevalence_of_underweight_weight_for_age_male_of_children_under"
NOTICE:  identifier "maternal_mortality_ratio_modeled_estimate_per_100_000_live_births" will be truncated to "maternal_mortality_ratio_modeled_estimate_per_100_000_live_birt"
NOTICE:  identifier "maternal_mortality_ratio_national_estimate_per_100_000_live_births" will be truncated to "maternal_mortality_ratio_national_estimate_per_100_000_live_bir"
NOTICE:  identifier "prevalence_of_stunting_height_for_age_female_of_children_under_5" will be truncated to "prevalence_of_stunting_height_for_age_female_of_children_under_"
NOTICE:  identifier "prevalence_of_wasting_weight_for_height_female_of_children_under_5" will be truncated to "prevalence_of_wasting_weight_for_height_female_of_children_unde"
NOTICE:  identifier "prevalence_of_wasting_weight_for_height_male_of_children_under_5" will be truncated to "prevalence_of_wasting_weight_for_height_male_of_children_under_"
NOTICE:  identifier "prevalence_of_severe_wasting_weight_for_height_female_of_children_under_5" will be truncated to "prevalence_of_severe_wasting_weight_for_height_female_of_childr"
NOTICE:  identifier "prevalence_of_severe_wasting_weight_for_height_male_of_children_under_5" will be truncated to "prevalence_of_severe_wasting_weight_for_height_male_of_children"
NOTICE:  identifier "prevalence_of_severe_wasting_weight_for_height_of_children_under_5" will be truncated to "prevalence_of_severe_wasting_weight_for_height_of_children_unde"
NOTICE:  identifier "vitamin_a_supplementation_coverage_rate_of_children_ages_6_59_months" will be truncated to "vitamin_a_supplementation_coverage_rate_of_children_ages_6_59_m"
NOTICE:  identifier "probability_of_dying_among_adolescents_ages_10_14_years_per_1_000" will be truncated to "probability_of_dying_among_adolescents_ages_10_14_years_per_1_0"
NOTICE:  identifier "probability_of_dying_among_adolescents_ages_15_19_years_per_1_000" will be truncated to "probability_of_dying_among_adolescents_ages_15_19_years_per_1_0"
NOTICE:  identifier "female_mortality_from_cvd_cancer_diabetes_or_crd_between_exact_ages_30_and_70" will be truncated to "female_mortality_from_cvd_cancer_diabetes_or_crd_between_exact_"
NOTICE:  identifier "male_mortality_from_cvd_cancer_diabetes_or_crd_between_exact_ages_30_and_70" will be truncated to "male_mortality_from_cvd_cancer_diabetes_or_crd_between_exact_ag"
NOTICE:  identifier "mortality_from_cvd_cancer_diabetes_or_crd_between_exact_ages_30_and_70" will be truncated to "mortality_from_cvd_cancer_diabetes_or_crd_between_exact_ages_30"
NOTICE:  identifier "people_using_at_least_basic_drinking_water_services_rural_of_rural_population" will be truncated to "people_using_at_least_basic_drinking_water_services_rural_of_ru"
NOTICE:  identifier "people_using_at_least_basic_drinking_water_services_urban_of_urban_population" will be truncated to "people_using_at_least_basic_drinking_water_services_urban_of_ur"
NOTICE:  identifier "people_using_at_least_basic_drinking_water_services_of_population" will be truncated to "people_using_at_least_basic_drinking_water_services_of_populati"
NOTICE:  identifier "people_using_safely_managed_drinking_water_services_rural_of_rural_population" will be truncated to "people_using_safely_managed_drinking_water_services_rural_of_ru"
NOTICE:  identifier "people_using_safely_managed_drinking_water_services_urban_of_urban_population" will be truncated to "people_using_safely_managed_drinking_water_services_urban_of_ur"
NOTICE:  identifier "people_using_safely_managed_drinking_water_services_of_population" will be truncated to "people_using_safely_managed_drinking_water_services_of_populati"
NOTICE:  identifier "risk_of_catastrophic_expenditure_for_surgical_care_of_people_at_risk" will be truncated to "risk_of_catastrophic_expenditure_for_surgical_care_of_people_at"
NOTICE:  identifier "risk_of_impoverishing_expenditure_for_surgical_care_of_people_at_risk" will be truncated to "risk_of_impoverishing_expenditure_for_surgical_care_of_people_a"
NOTICE:  identifier "people_using_at_least_basic_sanitation_services_rural_of_rural_population" will be truncated to "people_using_at_least_basic_sanitation_services_rural_of_rural_"
NOTICE:  identifier "rural_people_with_basic_handwashing_facilities_including_soap_and_water_rural_of_rural_population" will be truncated to "rural_people_with_basic_handwashing_facilities_including_soap_a"
NOTICE:  identifier "urban_people_with_basic_handwashing_facilities_including_soap_and_water_urban_of_urban_population" will be truncated to "urban_people_with_basic_handwashing_facilities_including_soap_a"
NOTICE:  identifier "people_with_basic_handwashing_facilities_including_soap_and_water_of_population" will be truncated to "people_with_basic_handwashing_facilities_including_soap_and_wat"
NOTICE:  identifier "mortality_rate_attributed_to_unintentional_poisoning_per_100_000_population" will be truncated to "mortality_rate_attributed_to_unintentional_poisoning_per_100_00"
NOTICE:  identifier "mortality_rate_attributed_to_unintentional_poisoning_female_per_100_000_female_population" will be truncated to "mortality_rate_attributed_to_unintentional_poisoning_female_per"
NOTICE:  identifier "mortality_rate_attributed_to_unintentional_poisoning_male_per_100_000_male_population" will be truncated to "mortality_rate_attributed_to_unintentional_poisoning_male_per_1"
NOTICE:  identifier "people_using_safely_managed_sanitation_services_rural_of_rural_population" will be truncated to "people_using_safely_managed_sanitation_services_rural_of_rural_"
NOTICE:  identifier "external_health_expenditure_channeled_through_government_of_external_health_expenditure" will be truncated to "external_health_expenditure_channeled_through_government_of_ext"
NOTICE:  identifier "external_health_expenditure_per_capita_ppp_current_international" will be truncated to "external_health_expenditure_per_capita_ppp_current_internationa"
NOTICE:  identifier "domestic_general_government_health_expenditure_of_current_health_expenditure" will be truncated to "domestic_general_government_health_expenditure_of_current_healt"
NOTICE:  identifier "domestic_general_government_health_expenditure_of_general_government_expenditure" will be truncated to "domestic_general_government_health_expenditure_of_general_gover"
NOTICE:  identifier "domestic_general_government_health_expenditure_per_capita_current_us" will be truncated to "domestic_general_government_health_expenditure_per_capita_curre"
NOTICE:  identifier "domestic_general_government_health_expenditure_per_capita_ppp_current_international" will be truncated to "domestic_general_government_health_expenditure_per_capita_ppp_c"
NOTICE:  identifier "domestic_private_health_expenditure_of_current_health_expenditure" will be truncated to "domestic_private_health_expenditure_of_current_health_expenditu"
*/



/*When running everything at once. You should not need this last part and is only here for reference
NOTICE:  identifier "total_alcohol_consumption_per_capita_female_liters_pure_project_estimates_female_15_and_above" will be truncated to "total_alcohol_consumption_per_capita_female_liters_pure_project"
NOTICE:  identifier "total_alcohol_consumption_per_capita_liters_pure_project_estimates_female_15_and_above" will be truncated to "total_alcohol_consumption_per_capita_liters_pure_project_estima"
NOTICE:  identifier "total_alcohol_consumption_per_capita_male_liters_pure_project_estimates_female_15_and_above" will be truncated to "total_alcohol_consumption_per_capita_male_liters_pure_project_e"
NOTICE:  identifier "prevalence_of_anemia_among_women_of_reproductive_age_15_to_49_percentage" will be truncated to "prevalence_of_anemia_among_women_of_reproductive_age_15_to_49_p"
NOTICE:  identifier "prevalence_of_anemia_among_children_age_6_to_59_months_percentage" will be truncated to "prevalence_of_anemia_among_children_age_6_to_59_months_percenta"
NOTICE:  identifier "prevalence_of_anemia_among_non_pregnant_women_of_reproductive_age_15_to_49_percentage" will be truncated to "prevalence_of_anemia_among_non_pregnant_women_of_reproductive_a"
NOTICE:  identifier "womens_share_of_population_ages_15_and_above_living_with_hiv_percentage" will be truncated to "womens_share_of_population_ages_15_and_above_living_with_hiv_pe"
NOTICE:  identifier "antiretroviral_therapy_coverage_percent_of_people_living_with_hiv" will be truncated to "antiretroviral_therapy_coverage_percent_of_people_living_with_h"
NOTICE:  identifier "incidence_of_hiv__50_and_above_per_thousand_uninfected_population" will be truncated to "incidence_of_hiv__50_and_above_per_thousand_uninfected_populati"
NOTICE:  identifier "adults_15_and_above_and_children_0_to_14_newly_infected_with_hiv" will be truncated to "adults_15_and_above_and_children_0_to_14_newly_infected_with_hi"
NOTICE:  identifier "incidence_of_hiv_15_to_24_per_thousand_uninfected_population_15_to_24" will be truncated to "incidence_of_hiv_15_to_24_per_thousand_uninfected_population_15"
NOTICE:  identifier "incidence_of_hiv_15_to_49_per_thousand_uninfected_population_15_to_49" will be truncated to "incidence_of_hiv_15_to_49_per_thousand_uninfected_population_15"
NOTICE:  identifier "antiretroviral_therapy_coverage_for_pmtct_percent_of_pregnat_women_living_with_hiv" will be truncated to "antiretroviral_therapy_coverage_for_pmtct_percent_of_pregnat_wo"
NOTICE:  identifier "immunization_measles_second_dose_percentage_of_children_by_nationally_recommended_age" will be truncated to "immunization_measles_second_dose_percentage_of_children_by_nati"
NOTICE:  identifier "prevalence_of_syphilis_percentage_of_women_attending_antenatal_care" will be truncated to "prevalence_of_syphilis_percentage_of_women_attending_antenatal_"
NOTICE:  identifier "prevalence_of_current_tobacco_use_females_percentage_female_adults" will be truncated to "prevalence_of_current_tobacco_use_females_percentage_female_adu"
NOTICE:  identifier "prevalence_of_underweight_weight_for_age_female_percentage_of_children_under_five" will be truncated to "prevalence_of_underweight_weight_for_age_female_percentage_of_c"
NOTICE:  identifier "prevalence_of_underweight_weight_for_age_male_percentage_of_children_under_five" will be truncated to "prevalence_of_underweight_weight_for_age_male_percentage_of_chi"
NOTICE:  identifier "prevalence_of_underweight_weight_for_age_percentage_of_children_under_five" will be truncated to "prevalence_of_underweight_weight_for_age_percentage_of_children"
NOTICE:  identifier "maternal_mortality_ratio_modeled_estimate_per_onehundredthousand_live_births" will be truncated to "maternal_mortality_ratio_modeled_estimate_per_onehundredthousan"
NOTICE:  identifier "maternal_mortality_ratio_national_estimate_per_onehundredthousand_live_births" will be truncated to "maternal_mortality_ratio_national_estimate_per_onehundredthousa"
NOTICE:  identifier "prevalence_of_stunting_height_for_age_female_percentage_children_under_five" will be truncated to "prevalence_of_stunting_height_for_age_female_percentage_childre"
NOTICE:  identifier "prevalence_of_stunting_height_for_age_male_percentage_children_under_five" will be truncated to "prevalence_of_stunting_height_for_age_male_percentage_children_"
NOTICE:  identifier "prevalence_of_stunting_height_for_age_percentage_children_under_five" will be truncated to "prevalence_of_stunting_height_for_age_percentage_children_under"
NOTICE:  identifier "prevalence_of_wasting_weight_for_height_female_percentage_children_under_five" will be truncated to "prevalence_of_wasting_weight_for_height_female_percentage_child"
NOTICE:  identifier "prevalence_of_wasting_weight_for_height_male_percentage_children_under_five" will be truncated to "prevalence_of_wasting_weight_for_height_male_percentage_childre"
NOTICE:  identifier "prevalence_of_wasting_weight_for_height_percentage_children_under_five" will be truncated to "prevalence_of_wasting_weight_for_height_percentage_children_und"
NOTICE:  identifier "prevalence_of_severe_wasting_weight_for_height_female_percentage_children_under_five" will be truncated to "prevalence_of_severe_wasting_weight_for_height_female_percentag"
NOTICE:  identifier "prevalence_of_severe_wasting_weight_for_height_male_percentage_children_under_five" will be truncated to "prevalence_of_severe_wasting_weight_for_height_male_percentage_"
NOTICE:  identifier "prevalence_of_severe_wasting_weight_for_height_percentage_children_under_five" will be truncated to "prevalence_of_severe_wasting_weight_for_height_percentage_child"
NOTICE:  identifier "vitamin_a_supplementation_coverage_rate_percentage_children_ages_6_to_59_months" will be truncated to "vitamin_a_supplementation_coverage_rate_percentage_children_age"
NOTICE:  identifier "adolescent_fertility_rate_births_per_thousand_women_ages_15_to_19" will be truncated to "adolescent_fertility_rate_births_per_thousand_women_ages_15_to_"
NOTICE:  identifier "contraceptive_prevalence_any_method_percentage_married_women_ages_15_to_49" will be truncated to "contraceptive_prevalence_any_method_percentage_married_women_ag"
NOTICE:  identifier "female_mortality_from_cvd_cancer_diabetes_or_crd_between_exact_ages_30_and_70" will be truncated to "female_mortality_from_cvd_cancer_diabetes_or_crd_between_exact_"
NOTICE:  identifier "male_mortality_from_cvd_cancer_diabetes_or_crd_between_exact_ages_30_and_70" will be truncated to "male_mortality_from_cvd_cancer_diabetes_or_crd_between_exact_ag"
NOTICE:  identifier "mortality_from_cvd_cancer_diabetes_or_crd_between_exact_ages_30_and_70" will be truncated to "mortality_from_cvd_cancer_diabetes_or_crd_between_exact_ages_30"
NOTICE:  identifier "people_using_at_least_basic_drinking_water_services_rural_of_rural_population" will be truncated to "people_using_at_least_basic_drinking_water_services_rural_of_ru"
NOTICE:  identifier "people_using_at_least_basic_drinking_water_services_urban_of_urban_population" will be truncated to "people_using_at_least_basic_drinking_water_services_urban_of_ur"
NOTICE:  identifier "people_using_safely_managed_drinking_water_services_rural_of_rural_population" will be truncated to "people_using_safely_managed_drinking_water_services_rural_of_ru"
NOTICE:  identifier "people_using_safely_managed_drinking_water_services_urban_of_urban_population" will be truncated to "people_using_safely_managed_drinking_water_services_urban_of_ur"
NOTICE:  identifier "risk_of_catastrophic_expenditure_for_surgical_care_of_people_at_risk" will be truncated to "risk_of_catastrophic_expenditure_for_surgical_care_of_people_at"
NOTICE:  identifier "risk_of_impoverishing_expenditure_for_surgical_care_of_people_at_risk" will be truncated to "risk_of_impoverishing_expenditure_for_surgical_care_of_people_a"
NOTICE:  identifier "rural_people_with_basic_handwashing_facilities_including_soap_and_water_ruralof_rural_population" will be truncated to "rural_people_with_basic_handwashing_facilities_including_soap_a"
NOTICE:  identifier "urban_people_with_basic_handwashing_facilities_including_soap_and_water_urban_of_urban_population" will be truncated to "urban_people_with_basic_handwashing_facilities_including_soap_a"
NOTICE:  identifier "people_with_basic_handwashing_facilities_including_soap_and_water_of_population" will be truncated to "people_with_basic_handwashing_facilities_including_soap_and_wat"
NOTICE:  identifier "mortality_rate_attribute_to_unintentional_poisoning_per_100000_population" will be truncated to "mortality_rate_attribute_to_unintentional_poisoning_per_100000_"
NOTICE:  identifier "mortality_rate_attribute_to_unintentional_poisoning_female_per_100000_population" will be truncated to "mortality_rate_attribute_to_unintentional_poisoning_female_per_"
NOTICE:  identifier "mortality_rate_attribute_to_unintentional_poisoning_male_per_100000_population" will be truncated to "mortality_rate_attribute_to_unintentional_poisoning_male_per_10"
NOTICE:  identifier "people_using_safely_managed_sanitation_services_rural_of_rural_population" will be truncated to "people_using_safely_managed_sanitation_services_rural_of_rural_"
NOTICE:  identifier "current_health_expenditure_per_capita_ppp_current_international_dollars" will be truncated to "current_health_expenditure_per_capita_ppp_current_international"
NOTICE:  identifier "external_health_expenditure_channeled_through_government_of_external_health_expenditure" will be truncated to "external_health_expenditure_channeled_through_government_of_ext"
NOTICE:  identifier "external_health_expenditure_per_capita_ppp_current_international_dollars" will be truncated to "external_health_expenditure_per_capita_ppp_current_internationa"
NOTICE:  identifier "domestic_general_government_health_expenditure_of_current_health_expenditure" will be truncated to "domestic_general_government_health_expenditure_of_current_healt"
NOTICE:  identifier "domestic_general_government_health_expenditure_of_general_government_expenditure" will be truncated to "domestic_general_government_health_expenditure_of_general_gover"
NOTICE:  identifier "domestic_general_government_health_expenditure_per_capita_current_us" will be truncated to "domestic_general_government_health_expenditure_per_capita_curre"
NOTICE:  identifier "domestic_general_government_health_expenditure_per_capita_ppp_current_international_dollars" will be truncated to "domestic_general_government_health_expenditure_per_capita_ppp_c"
NOTICE:  identifier "out_of_pocket_expenditure_per_capita_ppp_current_international_dollars" will be truncated to "out_of_pocket_expenditure_per_capita_ppp_current_international_"
NOTICE:  identifier "domestic_private_health_expenditure_of_current_health_expenditure" will be truncated to "domestic_private_health_expenditure_of_current_health_expenditu"
NOTICE:  identifier "probability_of_dying_among_adolescents_ages_10_14_years_per_1_000" will be truncated to "probability_of_dying_among_adolescents_ages_10_14_years_per_1_0"
NOTICE:  identifier "probability_of_dying_among_adolescents_ages_15_19_years_per_1_000" will be truncated to "probability_of_dying_among_adolescents_ages_15_19_years_per_1_0"
NOTICE:  identifier "total_alcohol_consumption_per_capita_female_liters_of_pure_alcohol_projected_estimates_female_15_years_of_age" will be truncated to "total_alcohol_consumption_per_capita_female_liters_of_pure_alco"
NOTICE:  identifier "total_alcohol_consumption_per_capita_liters_of_pure_alcohol_projected_estimates_15_years_of_age" will be truncated to "total_alcohol_consumption_per_capita_liters_of_pure_alcohol_pro"
NOTICE:  identifier "total_alcohol_consumption_per_capita_male_liters_of_pure_alcohol_projected_estimates_male_15_years_of_age" will be truncated to "total_alcohol_consumption_per_capita_male_liters_of_pure_alcoho"
NOTICE:  identifier "prevalence_of_anemia_among_women_of_reproductive_age_of_women_ages_15_49" will be truncated to "prevalence_of_anemia_among_women_of_reproductive_age_of_women_a"
NOTICE:  identifier "prevalence_of_anemia_among_children_of_children_ages_6_59_months" will be truncated to "prevalence_of_anemia_among_children_of_children_ages_6_59_month"
NOTICE:  identifier "prevalence_of_anemia_among_non_pregnant_women_of_women_ages_15_49" will be truncated to "prevalence_of_anemia_among_non_pregnant_women_of_women_ages_15_"
NOTICE:  identifier "incidence_of_hiv_ages_50_per_1_000_uninfected_population_ages_50" will be truncated to "incidence_of_hiv_ages_50_per_1_000_uninfected_population_ages_5"
NOTICE:  identifier "incidence_of_hiv_ages_15_24_per_1_000_uninfected_population_ages_15_24" will be truncated to "incidence_of_hiv_ages_15_24_per_1_000_uninfected_population_age"
NOTICE:  identifier "incidence_of_hiv_ages_15_49_per_1_000_uninfected_population_ages_15_49" will be truncated to "incidence_of_hiv_ages_15_49_per_1_000_uninfected_population_age"
NOTICE:  identifier "antiretroviral_therapy_coverage_for_pmtct_of_pregnant_women_living_with_hiv" will be truncated to "antiretroviral_therapy_coverage_for_pmtct_of_pregnant_women_liv"
NOTICE:  identifier "immunization_measles_second_dose_of_children_by_the_nationally_recommended_age" will be truncated to "immunization_measles_second_dose_of_children_by_the_nationally_"
NOTICE:  identifier "prevalence_of_underweight_weight_for_age_female_of_children_under_5" will be truncated to "prevalence_of_underweight_weight_for_age_female_of_children_und"
NOTICE:  identifier "prevalence_of_underweight_weight_for_age_male_of_children_under_5" will be truncated to "prevalence_of_underweight_weight_for_age_male_of_children_under"
NOTICE:  identifier "maternal_mortality_ratio_modeled_estimate_per_100_000_live_births" will be truncated to "maternal_mortality_ratio_modeled_estimate_per_100_000_live_birt"
NOTICE:  identifier "maternal_mortality_ratio_national_estimate_per_100_000_live_births" will be truncated to "maternal_mortality_ratio_national_estimate_per_100_000_live_bir"
NOTICE:  identifier "prevalence_of_stunting_height_for_age_female_of_children_under_5" will be truncated to "prevalence_of_stunting_height_for_age_female_of_children_under_"
NOTICE:  identifier "prevalence_of_wasting_weight_for_height_female_of_children_under_5" will be truncated to "prevalence_of_wasting_weight_for_height_female_of_children_unde"
NOTICE:  identifier "prevalence_of_wasting_weight_for_height_male_of_children_under_5" will be truncated to "prevalence_of_wasting_weight_for_height_male_of_children_under_"
NOTICE:  identifier "prevalence_of_severe_wasting_weight_for_height_female_of_children_under_5" will be truncated to "prevalence_of_severe_wasting_weight_for_height_female_of_childr"
NOTICE:  identifier "prevalence_of_severe_wasting_weight_for_height_male_of_children_under_5" will be truncated to "prevalence_of_severe_wasting_weight_for_height_male_of_children"
NOTICE:  identifier "prevalence_of_severe_wasting_weight_for_height_of_children_under_5" will be truncated to "prevalence_of_severe_wasting_weight_for_height_of_children_unde"
NOTICE:  identifier "vitamin_a_supplementation_coverage_rate_of_children_ages_6_59_months" will be truncated to "vitamin_a_supplementation_coverage_rate_of_children_ages_6_59_m"
NOTICE:  identifier "probability_of_dying_among_adolescents_ages_10_14_years_per_1_000" will be truncated to "probability_of_dying_among_adolescents_ages_10_14_years_per_1_0"
NOTICE:  identifier "probability_of_dying_among_adolescents_ages_15_19_years_per_1_000" will be truncated to "probability_of_dying_among_adolescents_ages_15_19_years_per_1_0"
NOTICE:  identifier "female_mortality_from_cvd_cancer_diabetes_or_crd_between_exact_ages_30_and_70" will be truncated to "female_mortality_from_cvd_cancer_diabetes_or_crd_between_exact_"
NOTICE:  identifier "male_mortality_from_cvd_cancer_diabetes_or_crd_between_exact_ages_30_and_70" will be truncated to "male_mortality_from_cvd_cancer_diabetes_or_crd_between_exact_ag"
NOTICE:  identifier "mortality_from_cvd_cancer_diabetes_or_crd_between_exact_ages_30_and_70" will be truncated to "mortality_from_cvd_cancer_diabetes_or_crd_between_exact_ages_30"
NOTICE:  identifier "people_using_at_least_basic_drinking_water_services_rural_of_rural_population" will be truncated to "people_using_at_least_basic_drinking_water_services_rural_of_ru"
NOTICE:  identifier "people_using_at_least_basic_drinking_water_services_urban_of_urban_population" will be truncated to "people_using_at_least_basic_drinking_water_services_urban_of_ur"
NOTICE:  identifier "people_using_at_least_basic_drinking_water_services_of_population" will be truncated to "people_using_at_least_basic_drinking_water_services_of_populati"
NOTICE:  identifier "people_using_safely_managed_drinking_water_services_rural_of_rural_population" will be truncated to "people_using_safely_managed_drinking_water_services_rural_of_ru"
NOTICE:  identifier "people_using_safely_managed_drinking_water_services_urban_of_urban_population" will be truncated to "people_using_safely_managed_drinking_water_services_urban_of_ur"
NOTICE:  identifier "people_using_safely_managed_drinking_water_services_of_population" will be truncated to "people_using_safely_managed_drinking_water_services_of_populati"
NOTICE:  identifier "risk_of_catastrophic_expenditure_for_surgical_care_of_people_at_risk" will be truncated to "risk_of_catastrophic_expenditure_for_surgical_care_of_people_at"
NOTICE:  identifier "risk_of_impoverishing_expenditure_for_surgical_care_of_people_at_risk" will be truncated to "risk_of_impoverishing_expenditure_for_surgical_care_of_people_a"
NOTICE:  identifier "people_using_at_least_basic_sanitation_services_rural_of_rural_population" will be truncated to "people_using_at_least_basic_sanitation_services_rural_of_rural_"
NOTICE:  identifier "rural_people_with_basic_handwashing_facilities_including_soap_and_water_rural_of_rural_population" will be truncated to "rural_people_with_basic_handwashing_facilities_including_soap_a"
NOTICE:  identifier "urban_people_with_basic_handwashing_facilities_including_soap_and_water_urban_of_urban_population" will be truncated to "urban_people_with_basic_handwashing_facilities_including_soap_a"
NOTICE:  identifier "people_with_basic_handwashing_facilities_including_soap_and_water_of_population" will be truncated to "people_with_basic_handwashing_facilities_including_soap_and_wat"
NOTICE:  identifier "mortality_rate_attributed_to_unintentional_poisoning_per_100_000_population" will be truncated to "mortality_rate_attributed_to_unintentional_poisoning_per_100_00"
NOTICE:  identifier "mortality_rate_attributed_to_unintentional_poisoning_female_per_100_000_female_population" will be truncated to "mortality_rate_attributed_to_unintentional_poisoning_female_per"
NOTICE:  identifier "mortality_rate_attributed_to_unintentional_poisoning_male_per_100_000_male_population" will be truncated to "mortality_rate_attributed_to_unintentional_poisoning_male_per_1"
NOTICE:  identifier "people_using_safely_managed_sanitation_services_rural_of_rural_population" will be truncated to "people_using_safely_managed_sanitation_services_rural_of_rural_"
NOTICE:  identifier "external_health_expenditure_channeled_through_government_of_external_health_expenditure" will be truncated to "external_health_expenditure_channeled_through_government_of_ext"
NOTICE:  identifier "external_health_expenditure_per_capita_ppp_current_international" will be truncated to "external_health_expenditure_per_capita_ppp_current_internationa"
NOTICE:  identifier "domestic_general_government_health_expenditure_of_current_health_expenditure" will be truncated to "domestic_general_government_health_expenditure_of_current_healt"
NOTICE:  identifier "domestic_general_government_health_expenditure_of_general_government_expenditure" will be truncated to "domestic_general_government_health_expenditure_of_general_gover"
NOTICE:  identifier "domestic_general_government_health_expenditure_per_capita_current_us" will be truncated to "domestic_general_government_health_expenditure_per_capita_curre"
NOTICE:  identifier "domestic_general_government_health_expenditure_per_capita_ppp_current_international" will be truncated to "domestic_general_government_health_expenditure_per_capita_ppp_c"
NOTICE:  identifier "domestic_private_health_expenditure_of_current_health_expenditure" will be truncated to "domestic_private_health_expenditure_of_current_health_expenditu"

*/