# Define the order of execution
all: load_data make_table make_plot render_report

# Install the R environment using renv
install:
	Rscript -e "if (!require('renv')) install.packages('renv'); renv::restore()"

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

# Build Docker image
docker_build:
	docker build -t taikonaka/mean-age-report .

# Run container and mount ./report to /project/output inside container
docker_run:
	mkdir -p report
	docker run --rm -v /$(shell pwd)/report:/project/output taikonaka/mean-age-report

# Build report using Docker
docker_report:
	docker run --rm -v ${PWD}:/project -w /project taikonaka/mean-age-report make report
