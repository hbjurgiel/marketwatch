# granie bibliotek
require.packages <- c("tidyverse", "quantmod", "eurostat", "rvest", "lubridate")
sapply(require.packages, require, character.only = TRUE) 

start.date <- "2019-01-31"  # EXCLUDING
end.date <- "2024-09-30"    # INCLUDING