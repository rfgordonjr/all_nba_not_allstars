library(here)
library(readr)
library(dplyr)
library(janitor)
library(tidyr)
library(polite)
library(rvest)
library(purrr)
library(stringr)

## read all-nba from https://www.basketball-reference.com/awards/all_league.html ####
all_league <- readr::read_csv(file = here::here('data/all_nba_bball_reference.csv')) %>% 
  clean_names() %>% 
  select(-voting) 
all_league_long <- all_league %>% 
  gather("col", "player", -c(season, lg, tm)) %>% 
  select(-col) %>% 
  mutate(season = as.numeric(str_sub(season, 1, 4)) + 1,
         position = if_else(season >= 1956, str_sub(player, nchar(player), nchar(player)), NA_character_),
         player = str_sub(player, 1, nchar(player) - 2),
         player = case_when(season == 1952 & grepl(pattern = "Davies", x = player, ignore.case=TRUE) ~ "Bob Davies/Dolph Schayes",
                            TRUE ~ player)) %>% 
  separate_rows(player, sep = "/") %>% 
  arrange(desc(season), tm) 

## read all-star data from https://en.wikipedia.org/wiki/List_of_NBA_All-Stars ####
session <- bow("https://en.wikipedia.org/wiki/List_of_NBA_All-Stars", force = TRUE)
result <- scrape(session) %>% 
  # html_nodes(xpath = '//*[@class="wikitable sortable jquery-tablesorter"]') %>% 
  html_nodes("table.wikitable") %>% 
  html_table()
all_stars <- result[[2]] %>% 
  select(-c(`#`, Notes, Reference)) %>% 
  clean_names()
all_star_by_year <- all_stars %>% 
  separate_rows(selections_c, sep = ";") %>% 
  mutate(selections_c = trimws(selections_c)) %>% 
  separate(selections_c, into = c("start", "end"), sep = "–", convert = TRUE) %>% 
  mutate(end = if_else(is.na(end), start, end),
         all_star_year = map2(start, end, seq)
  ) %>% 
  unnest(all_star_year) %>%
  # mutate(player = str_replace_all(player, "[^[:alnum:]]", "")) %>%
  mutate(player = str_replace_all(player, "\\*\\[a\\]", ""),
         player = str_replace_all(player, "\\^", ""),
         player = str_replace_all(player, "\\*", ""),
         player = str_replace_all(player, "\\†", ""),
         player = str_replace_all(player, "\\†", ""),
         player = str_replace_all(player, "\\§", "")
         ) 
# all_star_grouped <- all_star_by_year %>% 
#   group_by(player) %>% 
#   summarise(number = n_distinct(all_star_year)) %>% 
#   ungroup()
