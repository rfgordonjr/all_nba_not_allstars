## Introduction

Most NBA players that are named to an All-NBA team are also named to an All-Star team in the same year. Which NBA players are named to All-NBA _without_ being named to an All-Star team in the same year? Its rare, but maybe not as rare as you might think.

I got the idea from The Mismatch podcast. At around the 33-minute mark of [this episode](https://open.spotify.com/episode/0nFJjNqmjvdByeO2iJxa2N?si=da60ded1b41f41fd), Kevin O'Connor and Chris Vernon muse how Jalen Brunson might have the distinction of being named an All-NBA player for the 2022-2023 season despite being snubbed for All-Star selection.

Its actually happened to 58 NBA players since 1951. Its happened to 6 players exactly twice in their careers:

- Rudy Gobert (2017, 2019)
- Kevin Johnson (1989, 1992)
- John Stockton (1988, 1999)
- Hakeem Olajuwon (1991, 1999)
- DeAndre Jordan (2015, 2016)
- Carmelo Anthony (2006, 2009)

Here's the full list:

| Season|lg  |tm  |player              |position |
|------:|:---|:---|:-------------------|:--------|
|   2022|NBA |3rd |Pascal Siakam       |F        |
|   2021|NBA |3rd |Jimmy Butler        |F        |
|   2019|NBA |3rd |Rudy Gobert         |C        |
|   2017|NBA |2nd |Rudy Gobert         |C        |
|   2016|NBA |1st |DeAndre Jordan      |C        |
|   2016|NBA |2nd |Damian Lillard      |G        |
|   2015|NBA |3rd |DeAndre Jordan      |C        |
|   2014|NBA |3rd |Al Jefferson        |C        |
|   2014|NBA |3rd |Goran Dragić        |G        |
|   2013|NBA |2nd |Marc Gasol          |C        |
|   2012|NBA |3rd |Tyson Chandler      |C        |
|   2011|NBA |3rd |LaMarcus Aldridge   |F        |
|   2011|NBA |3rd |Zach Randolph       |F        |
|   2010|NBA |3rd |Andrew Bogut        |C        |
|   2009|NBA |3rd |Carmelo Anthony     |F        |
|   2008|NBA |2nd |Deron Williams      |G        |
|   2008|NBA |3rd |Manu Ginóbili       |G        |
|   2008|NBA |3rd |Tracy McGrady       |G        |
|   2006|NBA |3rd |Carmelo Anthony     |F        |
|   2004|NBA |3rd |Metta World Peace   |F        |
|   2002|NBA |3rd |Ben Wallace         |F        |
|   2001|NBA |3rd |Dirk Nowitzki       |F        |
|   2000|NBA |3rd |Stephon Marbury     |G        |
|   1999|NBA |1st |Alonzo Mourning     |C        |
|   1999|NBA |1st |Tim Duncan          |F        |
|   1999|NBA |1st |Karl Malone         |F        |
|   1999|NBA |1st |Allen Iverson       |G        |
|   1999|NBA |1st |Jason Kidd          |G        |
|   1999|NBA |2nd |Shaquille O'Neal    |C        |
|   1999|NBA |2nd |Grant Hill          |F        |
|   1999|NBA |2nd |Chris Webber        |F        |
|   1999|NBA |2nd |Tim Hardaway        |G        |
|   1999|NBA |2nd |Gary Payton         |G        |
|   1999|NBA |3rd |Hakeem Olajuwon     |C        |
|   1999|NBA |3rd |Kevin Garnett       |F        |
|   1999|NBA |3rd |Antonio McDyess     |F        |
|   1999|NBA |3rd |Kobe Bryant         |G        |
|   1999|NBA |3rd |John Stockton       |G        |
|   1998|NBA |2nd |Rod Strickland      |G        |
|   1998|NBA |3rd |Scottie Pippen      |F        |
|   1997|NBA |3rd |Anthony Mason       |F        |
|   1995|NBA |3rd |Dennis Rodman       |F        |
|   1995|NBA |3rd |Clyde Drexler       |G        |
|   1993|NBA |3rd |Derrick Coleman     |F        |
|   1993|NBA |3rd |Dražen Petrović     |G        |
|   1992|NBA |3rd |Kevin Johnson       |G        |
|   1991|NBA |3rd |Hakeem Olajuwon     |C        |
|   1989|NBA |2nd |Kevin Johnson       |G        |
|   1989|NBA |3rd |Robert Parish       |C        |
|   1988|NBA |2nd |John Stockton       |G        |
|   1987|NBA |2nd |Fat Lever           |G        |
|   1986|NBA |2nd |Charles Barkley     |F        |
|   1980|NBA |2nd |Gus Williams        |G        |
|   1979|NBA |2nd |Phil Ford           |G        |
|   1979|NBA |2nd |World B. Free       |G        |
|   1978|NBA |2nd |Kareem Abdul-Jabbar |C        |
|   1976|NBA |1st |Pete Maravich       |G        |
|   1972|NBA |2nd |Tiny Archibald      |G        |
|   1969|NBA |2nd |Dave DeBusschere    |F        |
|   1967|NBA |2nd |Sam Jones           |G        |
|   1966|NBA |2nd |Gus Johnson         |F        |
|   1964|NBA |2nd |John Havlicek       |G        |
|   1958|NBA |2nd |Tom Gola            |G        |
|   1951|NBA |2nd |Frankie Brian       |NA       |

The list can be downloaded under `data > all_nba_non_all_stars.xlsx` in this repository. Enjoy!

## Sources

Special thanks to Basketball-reference and Wikipedia

- NBA & ABA All-League Teams: <https://www.basketball-reference.com/awards/all_league.html#awards_all_league>
- List of NBA All-Stars: <https://en.wikipedia.org/wiki/List_of_NBA_All-Stars>

## Session Info

```
R version 4.2.1 (2022-06-23)
Platform: x86_64-apple-darwin17.0 (64-bit)
Running under: macOS Big Sur 11.7.4

Matrix products: default
LAPACK: /Library/Frameworks/R.framework/Versions/4.2/Resources/lib/libRlapack.dylib

locale:
[1] en_US.UTF-8/en_US.UTF-8/en_US.UTF-8/C/en_US.UTF-8/en_US.UTF-8

attached base packages:
[1] stats     graphics  grDevices utils     datasets  methods   base     

other attached packages:
 [1] openxlsx_4.2.5.2 ggplot2_3.3.6    stringr_1.4.1    purrr_0.3.4     
 [5] tidyr_1.2.0      janitor_2.1.0    readr_2.1.2      rvest_1.0.3     
 [9] polite_0.1.2     dplyr_1.0.10     here_1.0.1      

loaded via a namespace (and not attached):
 [1] Rcpp_1.0.9       lubridate_1.8.0  assertthat_0.2.1 rprojroot_2.0.3 
 [5] digest_0.6.29    utf8_1.2.2       mime_0.12        R6_2.5.1        
 [9] evaluate_0.16    highr_0.9        httr_1.4.4       pillar_1.8.1    
[13] rlang_1.0.5      curl_4.3.2       rstudioapi_0.14  rmarkdown_2.16  
[17] labeling_0.4.2   selectr_0.4-2    bit_4.0.4        munsell_0.5.0   
[21] xfun_0.32        compiler_4.2.1   spiderbar_0.2.5  pkgconfig_2.0.3 
[25] htmltools_0.5.3  tidyselect_1.1.2 tibble_3.1.8     fansi_1.0.3     
[29] crayon_1.5.1     tzdb_0.3.0       withr_2.5.0      grid_4.2.1      
[33] gtable_0.3.1     lifecycle_1.0.1  DBI_1.1.3        magrittr_2.0.3  
[37] scales_1.2.1     zip_2.2.0        cli_3.3.0        stringi_1.7.8   
[41] vroom_1.5.7      cachem_1.0.6     farver_2.1.1     fs_1.5.2        
[45] robotstxt_0.7.13 snakecase_0.11.0 ratelimitr_0.4.1 xml2_1.3.3      
[49] ellipsis_0.3.2   generics_0.1.3   vctrs_0.4.1      tools_4.2.1     
[53] bit64_4.0.5      glue_1.6.2       hms_1.1.2        parallel_4.2.1  
[57] fastmap_1.1.0    colorspace_2.0-3 memoise_2.0.1    knitr_1.40      
[61] usethis_2.1.6   
```
