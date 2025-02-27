# ==========================================
# Epigenetic Age Project - Data Loading Script
# Author: ANNE-MARIE SHARP
# Date: 27/02/2025
# Description: This script loads and preprocesses the GSE55763 DNA methylation dataset.
# ==========================================

# Load the reticulate package to use Python in R
library(reticulate)

# Set Python path (ensure it's correctly set for your machine)
use_python("C:/Users/USER/AppData/Local/Programs/Python/Python313/python.exe", required=TRUE)

# Verify Python Configuration
py_config()

# Load pandas in Python and read the dataset
py_run_string("
import pandas as pd

# Define the file path
file_path = 'C:/Users/USER/Documents/project_1/epigenetic_age_project/data/GSE55763_series_matrix.txt'


# Read the file, skipping the first 56 rows (metadata)
df = pd.read_csv(file_path, sep='\\t', skiprows=56, low_memory=False)

# Display first few rows
print(df.head())
")

# Convert Python dataframe to R dataframe
df_r <- py$df

# Check structure of the R dataframe
str(df_r)

# Save the cleaned dataframe as an RDS file (so we don’t have to reload it every time)
saveRDS(df_r, file="project_1/epigenetic_age_project/data/GSE55763_cleaned.rds")


# Print message confirming successful execution
print("✅ Data successfully loaded and saved!")

