<<<<<<< HEAD
# wgranie bibliotek

=======
# granie bibliotek
>>>>>>> e01b9067f339d2567b23e8080261432d3bc5e219
require.packages <- c("tidyverse", "quantmod", "eurostat", "rvest", "lubridate")
sapply(require.packages, require, character.only = TRUE) 

start.date <- "2019-01-31"  # EXCLUDING
<<<<<<< HEAD
end.date <- "2024-09-30"    # INCLUDING

#  RFR - 10 letnie obligacje skarbowe

PLY.10Y.B <- read.csv("https://stooq.pl/q/d/l/?s=10yply.b&i=d&o=0100000") %>% 
  mutate(Data = ymd(Data)) %>% 
  filter(Data > start.date & Data <= end.date) %>% 
  select(c("Data", "Zamkniecie")) %>% 
  rename("PL" = "Zamkniecie") %>% 
  as.xts()

DEY.10Y.B <- read.csv("https://stooq.pl/q/d/l/?s=10ydey.b&i=d&o=0100000") %>% 
  mutate(Data = ymd(Data)) %>% 
  filter(Data > start.date & Data <= end.date) %>% 
  select(c("Data", "Zamkniecie")) %>% 
  rename("DE" = "Zamkniecie") %>% 
  as.xts()

USY.10Y.B <- read.csv("https://stooq.pl/q/d/l/?s=10yusy.b&i=d&o=0100000") %>% 
  mutate(Data = ymd(Data)) %>% 
  filter(Data > start.date & Data <= end.date) %>% 
  select(c("Data", "Zamkniecie")) %>% 
  rename("US" = "Zamkniecie") %>% 
  as.xts()

# Inflacja - HICP

HICP <- get_eurostat("prc_hicp_manr", filters = list(geo = "PL", coicop = "CP00")) %>% 
  mutate(time = ymd(time)) %>%
  filter(time > start.date & time <= end.date) %>% 
  select(c("time", "values")) %>% 
  rename("Inflacja" = "values") %>% 
  as.xts() %>% 
  to.monthly(OHLC = FALSE)


# Stopy procentowe (3M)

interest <- get_eurostat("irt_st_m", filters = list(geo = "PL", int_rt = "IRT_M3")) %>% 
  mutate(time = ymd(time)) %>%
  filter(time > start.date & time <= end.date) %>% 
  select(c("time", "values")) %>% 
  rename("INT_3M" = "values") %>% 
  as.xts() %>% 
  to.monthly(OHLC = FALSE)

interest_df <- data.frame(Date = index(interest), coredata(interest))

ggplot(interest_df, aes(x = Date, y = INT_3M)) +
  geom_line(color = "purple", size = 1) +
  labs(title = "Stopy procentowe 3M", x = "Data", y = "Stopa procentowa (%)") +
  theme_minimal()

# Stopa bezrobocia
Unemployment <- get_eurostat("une_rt_m", filters = list(geo = "PL", age = "TOTAL", sex = "T")) %>%
  mutate(time = as.Date(time)) %>%  
  filter(time > start.date & time <= end.date) %>%
  select(time, values) %>%
  rename("Stopa_bezrobocia" = "values")


# PKB

GDP <- get_eurostat("tec00115", filters = list(geo = "PL")) %>%
  mutate(time = ymd(time)) %>%
  filter(time > start.date & time <= end.date) %>%
  select(time, values) %>%
  rename("PKB" = "values")

=======
end.date <- "2024-09-30"    # INCLUDING
>>>>>>> e01b9067f339d2567b23e8080261432d3bc5e219
