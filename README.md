# neu271_glm_tutorial

## Set up
1. Install miniconda: https://docs.conda.io/en/latest/miniconda.html
2. Create new conda environment: conda create -n glm-tutorial and activate
3. Install python: conda install python=3.12
4. Install nilearn: python -m pip install nilearn
5. Install jupyter: python -m pip install jupyter
6. Install matplotlib: python -m pip install matplotlib
7. Install datalad and datalad-container: conda install -c conda-forge datalad & python -m pip install datalad-container \
https://handbook.datalad.org/en/latest/intro/installation.html#install

## Set up with Docker
1. Install docker: https://www.docker.com/products/docker-desktop/
2. Clone the github repository and run the shell script to build the docker image and create the container environment.
```shell
git clone https://github.com/sjshim/neu271_glm_tutorial.git
cd neu271_glm_tutorial
chmod +x create_docker.sh
./create_docker.sh --git_user_name YOUR_USERNAME --git_user_email YOUR_USEREMAIL
```
Adding --git_user_name and --git_user_email details is required to download data using datalad. Running the shellscript create a new docker image in each user's local system, and it may take 10 ~ 15 minutes. This is why we don't use pre-built docker image, since then the git config in the image will be set with someone's info.

3. On terminal, you may find jupyter server is created. Click the link and open the Jupyter server.
4. Run fMRI_GLM_tutorial_docker.ipynb. 

**IMPORTANT NOTE: We found fitting FirstLevelModel in Nilearn library requires excessive memory, resulting in repeated Jupyter kernel shutdown** Adjusting --memory flag in docker run was insufficient to increase memory limit of a docker container when using the docker desktop. To do so, go to docker settings -> Resources, and increase memory limit to 16GB. To check the current docker memory limit, run 
```shell
docker stats
``` 

## General Linear Model Analysis
Useful resources:
1. Nilearn based guidebook about GLM: https://nilearn.github.io/stable/glm/index.html
2. Slightly longer text about GLM in neuroimaging (even though the title is "Short Intro to GLM"): https://www.fmrib.ox.ac.uk/primers/appendices/glm.pdf
3. Nilearn tutorials, I would highly recommend looking through these to familiarize yourself with the different functions nilearn offers!: https://nilearn.github.io/stable/auto_examples/04_glm_first_level/index.html

## Getting Started
1. Fork and clone this repo onto your local computer.
    a) Click the fork button on the upper right corner of this repo. \
    b) Navigate to your forked version of the repo. \
    c) Click the green code button to copy the HTTPS \
    d) Run: git clone 'copied repo path' \
    e) Move into the repo: cd neu271_glm_tutorial \

2. Open NARPS_first_level.ipynb: jupyter notebook NARPS_first_level.ipynb

## Sample code
There is a sample code for the NARPS_first_level.ipynb in the folder 'Sample_Code/NARPS_first_level_sample.ipynb'
If you get stuck on parts of the notebook, you may get some hints/inspiration from the sample code. 
The sample code is not going to be the only way to run this analysis! It's best to try to figure out which arguments you would want to use that best fit your interest. I'd be happy to chat about analysis choices that I'm more familiar with, but I'm also open to figuring out specific analytical choices together :) 

## Other resources:
BIDS documentation: https://bids.neuroimaging.io/
