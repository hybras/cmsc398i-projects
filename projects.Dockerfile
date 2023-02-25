FROM ghcr.io/hybras/cmsc398i:latest

USER autograder
WORKDIR /autograder/projects_dir/project/src
WORKDIR /autograder/projects_dir/project
COPY --chown=autograder test test

WORKDIR /autograder
COPY run_autograder .