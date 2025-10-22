# Build from python docker image. Used the slim version to reduce image size. 3.12-alpine is not tested.
FROM python:3.12-slim

# Minimize prompts and optimize pip
ENV DEBIAN_FRONTEND=noninteractive \
    PYTHONUNBUFFERED=1 \
    PIP_NO_CACHE_DIR=1 \
    PIP_NO_INPUT=1

ARG GIT_USER_NAME
ARG GIT_USER_EMAIL

# Install git and git-annex required for running datalad.
RUN apt-get update && \
    apt-get install -y --no-install-recommends git git-annex && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install required packages
WORKDIR /app
COPY requirements.txt .
RUN pip install -r requirements.txt

# Using symlinks via datalad requires user github information (dunno why).
# Import data using github info given when executing create_docker.sh during docker build.
# Since /data is not mounted on local, one may change directory (or mount /data). 
WORKDIR /data
RUN git config --global user.name "${GIT_USER_NAME}" && \
    git config --global user.email "${GIT_USER_EMAIL}" && \
    python -c "import datalad.api as dl; dl.install('https://github.com/OpenNeuroDatasets/ds001734.git')"

#GitHub Respoitory will be mounted at /home using the -v flag in docker run. Changing the default working directory to /home.
WORKDIR /home

# Expose Jupyter port
EXPOSE 8888