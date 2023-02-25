FROM gradescope/autograder-base:ubuntu-22.04

RUN apt-get update && \
    apt-get -y install --no-install-recommends \
    'shellcheck' \
    'shfmt' \
    'bats'  && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Create a non-priveleged user
RUN useradd autograder -m && mkdir -p /autograder/projects_dir
COPY --chown=autograder test /autograder/projects_dir/test

USER autograder
WORKDIR /autograder
