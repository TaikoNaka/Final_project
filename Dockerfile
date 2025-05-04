# Use tidyverse as a base image
FROM rocker/tidyverse:latest

# Set working directory
WORKDIR /project

# Set user library path early
ENV R_LIBS_USER=/usr/local/lib/R/site-library

# Pre-install renv and here before restore (avoid chicken-and-egg)
RUN R -e "install.packages(c('renv', 'here'), lib = Sys.getenv('R_LIBS_USER'))"

# Copy renv files first (to cache early)
COPY renv.lock .
COPY renv/ renv/

# Now restore the renv environment
RUN Rscript -e "renv::restore()"

# Copy rest of the project
COPY . .

# Default command
CMD ["make", "all"]
