---
title: 'bisonpicsuite: A set of R packages to estimate wood bison population parameters from remote camera data.'
authors:
- name: Nicole Hill
  orcid: 0000-0002-7623-2153
  affiliation: 1
- name: Ayla Pearson
  orcid: 0000-0001-7388-1222
  corresponding: true
  affiliation: 1
- name: Andrea Kortello
  orcid: 0000-0001-8047-3331
  affiliation: 1
affiliations:
- index: 1
  name: Poisson Consulting, Canada
date: 17 October 2024
bibliography: paper.bib
tags:
  - bisonpictools
  - runbisonpic
  - shinybisonpic
  - camera
  - R
---

# Statement of Need

Knowledge of population status and trends is integral to the effective conservation and management of wildlife populations. 
To this end, demographic ratios (i.e Calf:Cow ratios) are routinely used in wildlife management as a readily observable measure of productivity and for forecasting population trajectories [@fuller2007; @wittmer2005; @bender2006]. 
More complex state-space population modelling approaches [@buckland2004; @paterson2019; @mizuki2020; @newman2023] can also be used to estimate survival and fecundity. 
Both approaches require classified (by age and sex) counts of individuals in a herd.

In remote areas, estimates of herd size and composition are typically obtained from aerial surveys. 
However, distinguishing animal age and sex can be challenging, particularly in forested environments if animals flee or hide from aircraft. 
Remote cameras present an alternative method for obtaining classified counts. 
Wildlife cameras have been utilized for purposes including species occupancy, density, behaviour, and to identify individuals through distinct markings [@magoun2011; @steenweg2016; @caravaggi2017; @green2020; @nakashima2020; @singh2022]. 
Although different age and sex classes can be readily distinguished in remote camera photos for many ungulate species [@laskin2020], we are not aware of any published studies or software that use camera data to estimate population parameters from classified counts of animals without individual markings.

# Summary

We present a method utilizing classified counts from remote cameras to evaluate wood bison herd demographics.
We modeled demographic ratios, survival, and productivity using an integrated population model (IPM) to combine stage-structured information from multiple data sources to describe demographic states and transitions [@schaub_integrated_2022]. 
The data included the classified counts from camera trap observations, and census and proportion of calves estimates from aerial surveys.

The counts of classified individuals from each camera trap observation were represented by a series of binomial distributions that informed both the counts of each age class (calf, yearling, adult) and corresponding sex ratios.
This method allowed us to account for individuals that were classified by age, but not by sex.
The probabilities for each of the binomial draws were informed by the estimated proportions of individuals in each age and sex class in the population on a given date, which was modelled using a Birth-Age-Survival (BAS) subprocess formulation of a population projection model [@newman_modelling_2014].

For example, the count of calves at the $i^{th}$ camera trap observation was modelled as follows: 

\[C_i \sim \text{Binomial}(N_i, p_{C_i})\]

where $C_i$ is the number of calves, $N_i$ is the total group size, and $p_{C_i}$ is the sum of the expected proportions of male and female calves on the date of the $i^{th}$ observation.

The sex ratio of calves was modelled as follows:

\[F0_i \sim \text{Binomial}\Biggl(C_i, \frac{p_{F0_i}}{p_{F0_i} + p_{M0_i}}\Biggr)\]

where $F0_i$ is the number of female calves, $M0_i$ is the total number of male calves, and $p_{F0_i}$ and $p_{M0_i}$ are the expected proportion of female and male calves on the date of the $i^{th}$ observation, respectively.

The population projection model also estimated the fecundity rate and proportion of fecund 2+-year-old cows, and annually-varying survival rates for each class.
The information from the aerial surveys was integrated into the model, helping to inform the total number of individuals (i.e., the sum of the class-wise abundances) and the proportion of calves (i.e., $p_{F0_i} + p_{M0_i}$) on the dates of the aerial surveys.
A Gaussian process regression [@mcelreath2016] accounts for the spatial and temporal correlation structure of the camera trap observations.
This novel approach requires an initial population estimate but does not require individual identification and could be applied non-invasively to a wide array of difficult to survey species to estimate key parameters that drive population dynamics.

This method is implemented using three connected R packages.
The underlying functionality to clean, process, model, and visualize data is provided by `bisonpictools`.
The other two R packages are apps that provide a user-friendly interface to `bisonpictools`. 
The first app is `shinybisonpic`, a web-based app that allows users to upload and explore the data by viewing the locations of cameras and the ratios of selected sex-age groups. 
The second app is `runbisonpic`, a locally-run app that allows users to run a model to calculate the abundance by class, total abundance, survival and fecundity rates, and various sex-age ratios. 
All three packages (`bisonpictools`, `shinybisonpic` and `runbisonpic`) were developed for Alberta Environment and Parks to enable remote game cameras to monitor the herd composition of wood bison and estimate the population parameter.

# Features

- Data Standardization
  - Uploaded data is put through a quality control process which detects values that are not allowed to reduce errors in the following steps.
- Data Exploration
  - Users can explore the camera locations on an interactive map which helps to spatially verify location data are accurate.
  - Users can explore the ratios of any combination of sex-age groups (Figure 1).
- Data Analysis
  - Complex custom model that only has a single parameter users must learn how to tune which makes the method accessible for users of various skill levels.
  - Downloadable analysis object which allows power users to generate their own plots or perform further analysis.
  - Predictions of the estimated class-wise and total abundances, survival and fecundity rates, and key ratio estimates.
- Documentation
  - Basic instructions are easily accessible within the app.
  - User Manual vignette that walks users through the detailed steps and options.
  
![](ratio-plot-2.png "Figure 1. Calf:Cow ratio of the Ronald Lake Wood Bison herd by camera trap location ID, date of observation, study year, season, and group size. A ratio of 0 represents a group dominated by cows, while an infinite ratio (Inf) represents a group dominated by calves.")

*Figure 1. Calf:Cow ratio of the Ronald Lake Wood Bison herd by camera trap location ID, date of observation, study year, season, and group size. A ratio of 0 represents a group dominated by cows, while an infinite ratio (Inf) represents a group dominated by calves.*

# Limitations

The model can take over 5 hours to run.

# Acknowledgements

This work was funded by Alberta Environment and Protected Areas.
We thank Troy Hegel, Joe Thorley, and John Boulanger for senior review.

# References
