# Bay Area Air Pollution & Health Impact Analysis

This project analyzes the relationship between **air pollution exposure** and **public health outcomes** across California’s Bay Area counties.  
It explores how pollutants like PM2.5, Ozone, and Diesel PM affect conditions such as **asthma** and **cardiovascular disease**, combining statistical, spatial, and machine learning analysis.

---

## Objectives
- Clean and prepare environmental and health datasets for analysis.
- Identify correlations between pollution metrics and health outcomes.
- Visualize county-level pollution patterns and health impacts.
- Train machine learning models to predict asthma rates based on pollution levels.

---

##  Methodology Overview
1. **Data Cleaning**
   - Filled missing values in key columns (`Asthma`, `Cardiovascular Disease`) with median values.
   - Dropped incomplete records in critical columns like `DRAFT CES 4.0 Score`.
   - Converted date columns to datetime format and standardized feature names.

2. **Exploratory Data Analysis (EDA)**
   - Filtered dataset to essential variables: PM2.5, Ozone, Diesel PM, Pollution Burden, and health metrics.
   - Calculated average pollution burden per county.
   - Generated summary statistics and visual insights.

3. **Geospatial Visualization**
   - Used **GeoPandas** to map pollution distribution across Bay Area coordinates.
   - Visualized PM2.5 concentrations by longitude/latitude using scatter and heat maps.

4. **Correlation Analysis**
   - Computed a correlation matrix between pollution, population, and socioeconomic indicators (Poverty, Unemployment, Housing Burden).
   - Found strongest correlations between:
     - PM2.5 ↔ Diesel PM (0.25)
     - Diesel PM ↔ Pollution Burden (0.44)
     - Ozone ↔ Asthma rates (0.26)

5. **Machine Learning Models**
   - Implemented **Random Forest Regressor** to predict asthma rates.
   - Achieved:
     ```
     R² Score: 0.29
     Mean Absolute Error: 18.6
     ```
   - Developed a **Gradient Boosting Regressor** to forecast future health risks using temporal data (Month, Year).

---

## Key Insights
- PM2.5 and Ozone levels showed the strongest correlation with hospital admissions.  
- Southern Bay Area counties exhibited higher average pollutant levels during dry seasons.  
- Visualization of trends over time revealed increasing Diesel PM during winter months.

## Key Visualizations
- **Bar Chart:** Average pollution burden by county.
- **Heatmap:** Correlation between pollutants and health factors.
- **Scatter Plot:** PM2.5 distribution across geographic coordinates.
- **Line Plot:** Seasonal asthma trends by month.
- **Bar Chart:** County-wise vulnerability index (poverty + unemployment + isolation).

---

##  Tools & Libraries
| Category | Tools |
|-----------|--------|
| Language | Python |
| Data Analysis | Pandas, NumPy |
| Visualization | Matplotlib, Seaborn |
| Geospatial | GeoPandas |
| Machine Learning | scikit-learn (RandomForest, GradientBoosting) |
| Environment | Google Colab |

---


