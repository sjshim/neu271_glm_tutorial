# neu271_glm_tutorial

## Set up
1. Install miniconda: https://docs.conda.io/en/latest/miniconda.html
2. Create new conda environment: conda create -n glm-tutorial
3. Install python: conda install python
4. Install nilearn: pip install nilearn
5. Install jupyter: pip install jupyter
6. Install datalad and datalad-container: https://handbook.datalad.org/en/latest/intro/installation.html#install & pip install datalad-container

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
