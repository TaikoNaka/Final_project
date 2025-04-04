# Define the order of execution
all: load_data make_table make_plot render_report

# Step 1: Load and clean the data
load_data:
	Rscript code/00_load_data.R

# Step 2: Create the table
make_table:
	Rscript code/01_make_table.R

# Step 3: Generate the plot
make_plot:
	Rscript code/02_make_plot.R

# Step 4: Render the report
render_report:
	Rscript code/03_render_report.R

# Clean output files (optional)
clean:
	rm output/data_clean.rds output/mean_age_table.rds output/trend_plot.png final_report.html
