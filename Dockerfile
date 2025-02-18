FROM rocker/tidyverse:4.2.2

RUN apt-get update && \
    apt-get install -y jq && \
    apt-get purge --auto-remove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN Rscript -e 'install.packages("testthat")'

COPY . /opt/test-runner
WORKDIR /opt/test-runner
ENTRYPOINT ["/opt/test-runner/bin/run.sh"]
