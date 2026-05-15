\# EPL Performance Analysis (2015-16 to 2024-25)



\## Project Overview

End-to-end data analysis project on 3,800 Premier League matches across 10 seasons. Raw data was cleaned and transformed using SQL and Power Query, analyzed using SQL queries, and visualized through an interactive Excel dashboard with dynamic filters.



\## Tools Used

\- \*\*MySQL\*\* — data import, cleaning, transformation and analysis

\- \*\*Microsoft Excel\*\* — Power Query for ETL, Pivot Tables for analysis, Interactive Dashboard



\## Dataset

\- 3,800 matches from 2015-16 to 2024-25

\- 36 teams across 10 seasons

\- Columns: Season, Match Date, Home Team, Away Team, Home Goals, Away Goals, Match Result, Halftime Goals, Winner, Total Goals, Goal Difference

\- Source: Football-Data.co.uk



\## Project Structure

```

EPL-Performance-Analysis/

├── Assets/           → All project screenshots

├── Excel/            → Interactive Excel Dashboard

├── SQL Scripts/      → Data pipeline and analysis scripts

└── README.md

```



\## SQL Pipeline

| File | Description |

|------|-------------|

| 01\_import\_raw\_files | Import 10 seasons of raw CSV files into MySQL |

| 02\_create\_clean\_table\_per\_season | Clean and standardize data per season |

| 03\_create\_master\_table | Combine all 10 seasons into master table |

| 04\_create\_final\_clean\_table | Final clean table with calculated columns |

| 05\_analysis\_queries | 9 analytical queries covering all key insights |



\## SQL Analysis Queries

| Query | Description | Technique Used |

|-------|-------------|----------------|

| 1 | Total matches per season | GROUP BY |

| 2 | Season by season summary | CASE WHEN, AVG, COUNT |

| 3 | All time top 10 teams by wins | GROUP BY, ORDER BY |

| 4 | Top 10 dominant home teams | ROUND, WIN%, AVG |

| 5 | Season by season champion | CTE + ROW\_NUMBER Window Function |

| 6 | Top dominant teams all time | UNION ALL |

| 7 | Avg home and away goals per season | AVG, GROUP BY |

| 8 | Most consistent teams | CTE + AVG wins per season |

| 9 | Home vs Away win % top 10 | CTE + JOIN |



\## Key SQL Findings

\- Leicester City won 2015-16 title with only 23 wins — the famous miracle season

\- Man City dominated 6 out of 10 seasons (2017-18 to 2023-24)

\- Liverpool won 2019-20 and 2024-25 titles

\- Home teams win 40.8% vs 34.7% away — home advantage is real across all 10 seasons

\- Man City highest avg goals per match among all teams



\## Excel Workbook Structure

| Sheet | Description |

|-------|-------------|

| Raw EPL Files | Original unmodified raw data |

| Clean Data | Power Query cleaned and transformed data |

| 10 Season Analysis | Pivot table — wins, goals, matches across all seasons |

| Wins vs Goals | Pivot chart — do goals and clean sheets drive wins? |

| Home vs Away | Pivot chart — home vs away dominance top teams |

| Dashboard | Interactive dashboard with 4 charts and 4 KPIs |



\## Power Query Transformations

\- Imported 10 separate CSV files and combined into single table

\- Standardized season column format

\- Added calculated columns — Winner, Match Result, Goal Difference, Total Goals

\- Removed irrelevant columns from raw data

\- Loaded clean data into Excel table format



\## Dashboard Features

\- \*\*Season Filter\*\* — dropdown controlling all 4 charts and KPIs

\- \*\*Team Filter\*\* — dynamically updates based on selected season showing only that season's teams

\- \*\*Points Table\*\* — horizontal stacked bar showing points from wins and draws with goal difference tiebreaker — selected team highlighted in teal

\- \*\*Match Outcomes by Team\*\* — stacked column chart showing wins draws losses composition — selected team highlighted

\- \*\*Win/Draw/Loss Profile\*\* — pie chart showing percentage breakdown responding to both filters

\- \*\*Home vs Away Win %\*\* — scatter chart showing top 5 teams plus selected team positioned by home and away win rates

\- \*\*4 KPI Cards\*\* — Goals Scored, Goals Conceded, Goal Difference, Avg Goals per Match



\## Key Dashboard Insights

\- Man City earned 795 out of 853 points from wins — most dominant team of the decade

\- Leicester 2015-16 miracle season visible when filtered — low points but champion

\- Southampton 2023-24 shows 79% losses — worst season in dataset

\- Home win rate consistently 6-8% higher than away win rate across all teams



\## Dashboard Screenshots



\### Overview — All Seasons All Teams

!\[Dashboard Overview](Assets/dashboard\_overview.png)



\### Season Filter Applied

!\[Season Filter](Assets/dashboard\_season\_filter.png)



\### Top Team Selected

!\[Top Team](Assets/dashboard\_top\_team.png)



\### Lower Team Selected — 11th Position Highlight

!\[Lower Team](Assets/dashboard\_lower\_team.png)



\### Pivot Charts

!\[10 Season Analysis](Assets/pivot\_10season.png)

!\[Wins vs Goals](Assets/pivot\_wins\_goals.png)

!\[Home vs Away](Assets/pivot\_home\_away.png)



\### SQL Queries and Results

!\[Champion Query](Assets/sql\_05\_champion\_query.png)

!\[Dominant Teams](Assets/sql\_06\_dominant\_teams.png)

!\[Home Away Win Rate](Assets/sql\_09\_home\_away.png)

