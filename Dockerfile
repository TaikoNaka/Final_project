# Use tidyverse as a base image
FROM rocker/tidyverse:latest

WORKDIR /project

# Copy everything first
COPY . .

# Install renv and restore environment
RUN R -e "install.packages('renv'); renv::restore()"

# Set user lib path and make sure 'here' is there just in case
ENV R_LIBS_USER=/usr/local/lib/R/site-library
RUN Rscript -e "install.packages('here', lib = Sys.getenv('R_LIBS_USER'))"

# Run the pipeline
CMD ["make", "all"]
