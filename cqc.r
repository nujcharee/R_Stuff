library(cqcr)
loc1 <- cqc_locations_search(care_home = TRUE, 
          local_authority = "North Yorkshire")

loc1

care_home_list <- lapply(loc1$location_id, cqc_location)

x <- map_dfr(care_home_list, extract, c("location_id",
                                    "provider_id",
                                    "organisation_type",
                                    "type",
                                    "name",
                                    "onspd_ccg_code",
                                    "onspd_ccg_name",
                                    "ods_code",
                                    "uprn"))


x_tibble <- as_tibble(t(sapply(care_home_list,c)))
x_tibble[x_tibble == ""] <- NA

# registration_status = map_chr(., "registration_status"),
# registration_date = map_chr(., "registration_date"),
# number_of_beds  = map_chr(., "number_of_beds"),
# postal_address_line_1 = map_chr(., "postal_address_line_1"),
# postal_address_line_2 = map_chr(., "postal_address_line_2"),
# postal_address_town_city = map_chr(., "postal_address_town_city"),
# postal_address_county = map_chr(., "postal_address_county"),
# region = map_chr(., "region"),
# postal_code = map_chr(., "postal_code"),
# onspd_latitude = map_chr(., "onspd_latitude"),
# onspd_longitude = map_chr(., "onspd_longitude"),
# care_home = map_chr(., "care_home"),
# inspection_directorate = map_chr(., "inspection_directorate"),
# main_phone_number = map_chr(., "main_phone_number"),
# constituency = map_chr(., "constituency"),
# local_authority = map_chr(., "local_authority"),
# last_inspection = map_chr(., "last_inspection"),
# last_report = map_chr(., "last_report"),
# regulated_activities = map_chr(., "regulated_activities"),
# gac_service_types = map_chr(., "gac_service_types"),
# inspection_categories = map_chr(., "inspection_categories"),
# specialisms = map_chr(., "specialisms"),
# current_ratings  = map_chr(., "current_ratings"),
# historic_ratings = map_chr(., "historic_ratings")


care_home_list %>% {
  tibble(
    location_id = map_chr(., "location_id"),
    provider_id = map_chr(., "provider_id"),
    organisation_type = map_chr(., "organisation_type"),
    type = map_chr(., "type"),
    name = map_chr(., "name"),
    onspd_ccg_code = map_chr(., "onspd_ccg_code"),
    onspd_ccg_name = map_chr(., "onspd_ccg_name"),
    # ods_code = map_chr(., "ods_code"),
    uprn = map_chr(., "uprn"),
  
    )
}
