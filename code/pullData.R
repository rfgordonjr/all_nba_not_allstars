library(here)
library(readr)
library(dplyr)
library(janitor)
library(tidyr)
library(polite)
library(rvest)
library(purrr)
library(stringr)
library(ggplot2)
library(openxlsx)

## read all-nba from https://www.basketball-reference.com/awards/all_league.html ####
all_league <- readr::read_csv(file = here::here('data/all_nba_bball_reference.csv')) %>% 
  clean_names() %>% 
  select(-voting) 
all_league_long <- all_league %>% 
  gather("col", "player", -c(season, lg, tm)) %>% 
  select(-col) %>% 
  mutate(season = as.numeric(str_sub(season, 1, 4)) + 1,
         position = if_else(season >= 1956, str_sub(player, nchar(player), nchar(player)), NA_character_),
         player = if_else(season >= 1956, str_sub(player, 1, nchar(player) - 2), player),
         player = case_when(season == 1952 & grepl(pattern = "Davies", x = player, ignore.case=TRUE) ~ "Bob Davies/Dolph Schayes",
                            season == 1971 & grepl(pattern = "Zelmo Beaty C Dan Issel C", x = player, ignore.case=TRUE) ~ "Zelmo Beaty/Dan Issel",
                            TRUE ~ player),
         position = if_else(season == 1971 & grepl(pattern = "Zelmo Beaty/Dan Issel", x = player, ignore.case=TRUE), "C", position)) %>% 
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
         season = map2(start, end, seq)
  ) %>% 
  unnest(season) %>%
  # mutate(player = str_replace_all(player, "[^[:alnum:]]", "")) %>%
  mutate(player = str_replace_all(player, "\\*\\[a\\]", ""),
         player = str_replace_all(player, "\\*\\[b\\]", ""),
         player = str_replace_all(player, "\\^", ""),
         player = str_replace_all(player, "\\*", ""),
         player = str_replace_all(player, "\\†", ""),
         player = str_replace_all(player, "\\†", ""),
         player = str_replace_all(player, "\\§", ""),
         player = case_when(grepl("Archibald", player, ignore.case=TRUE) ~ "Tiny Archibald",
                            grepl("Penny Hardaway", player, ignore.case=TRUE) ~ "Anfernee Hardaway",
                            TRUE ~ player)
         ) %>% 
  arrange(desc(season))
# all_star_by_year %>% filter(grepl("Archibald", player, ignore.case=TRUE))
# all_star_grouped <- all_star_by_year %>% 
#   group_by(player) %>% 
#   summarise(number = n_distinct(all_star_year)) %>% 
#   ungroup()

## join data to answer which all nba teams werent all stars ####
min(all_star_by_year$all_star_year) # 1951
min(all_league_long$season) # 1947
all_league_not_all_stars <- all_league_long %>% 
  filter(season >= 1951, lg == "NBA") %>% 
  anti_join(all_star_by_year, by = c("season", "player")) 
head(all_league_not_all_stars)
all_star_by_year %>% filter(grepl("Pascal", x = player, ignore.case=TRUE), season == 2022)
all_star_by_year %>% filter(grepl("Pascal", x = player, ignore.case=TRUE))
all_league_not_all_stars %>% filter(grepl("Zach Randolph", player))

## Data Visualizations ####
## which positions?
all_league_not_all_stars %>% 
  ggplot(aes(position)) +
  geom_bar() +
  coord_flip()
## which players?
all_league_not_all_stars %>% 
  count(player) %>% 
  arrange(desc(n)) %>% #  nrow() # 58
  filter(n > 1) %>%
  ggplot(aes(reorder(player, n), n)) +
  geom_bar(stat = "identity") +
  scale_y_continuous(breaks = 1:13, labels = 1:13) +
  coord_flip() +
  labs(x = "Player",
       y = "Count")
## spot check
all_league_not_all_stars %>% filter(grepl("DeAndre Jordan", player, ignore.case=TRUE))
all_league_long %>% filter(grepl("DeAndre Jordan", player, ignore.case=TRUE))
all_star_by_year %>% filter(grepl("DeAndre Jordan", player, ignore.case=TRUE))

## write to file ####
openxlsx::write.xlsx(x = all_league_not_all_stars,file = here::here('data/all_nba_non_all_stars.xlsx'))
