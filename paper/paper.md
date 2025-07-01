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
date: 28 October 2024
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
To this end, demographic ratios (e.g., Calf:Cow ratios, Fig. 1) are routinely used in wildlife management as a readily observable measure of productivity and for forecasting population trajectories [@fuller2007; @wittmer2005; @bender2006]. 
More complex population modeling approaches [@buckland2004; @paterson2019; @mizuki2020; @newman2023] can also be used to estimate survival and fecundity.
To understand the age composition of a population, both approaches require classified (by age and sex) counts of individuals.

The use of remote cameras to monitor wildlife species for conservation and management has become widespread and R packages have been developed to manage camera data and estimate species occupancy, density and abundance [@doser_spabundance_2024; @doser_spoccupancy_2022; @moeller_spacentime_2022; @naimi_sdm_2016; @niedballa_camtrapr_2016].
In animals without individual markings, other population parameters are seldom estimated, although exceptions exist [@horneestimating2021; @chitwoodare2017; @ikedaevaluation2013]. 
The authors are unaware of any other R packages that use classified counts from camera data to generate estimates of survival and recruitment, even though different age and sex classes can be readily distinguished in remote camera photos for many species [@laskin2020].
We demonstrate an R package using a Bayesian integrated population model to generate estimates for these vital rates, combined with a Gaussian process regression to account for spatial and temporal correlations.

![*Shinybisonpic app data exploration plot, showing calf:cow ratios over time from individual remote cameras in the Ronald Lake Wood Bison range in northeast Alberta. Ratios are shown with camera trap ID, observation date, study year, season, and group size. A ratio of 0 represents a group of entirely cows, while an infinite ratio (Inf) represents a group of entirely calves.* \label{fig:ratioplot}](ratio-plot.png) 

# Summary

We present a method utilizing classified counts from remote cameras to evaluate wood bison (*Bison bison athabascae*) herd demographics.
We modeled demographic ratios, survival, and productivity using a Bayesian integrated population model (IPM) to combine stage-structured information from multiple data sources and estimate demographic states and transitions [@schaubintegrated2022]. 
The data included classified counts from camera traps and calf proportion and census estimates from aerial surveys.

A series of binomial distributions were used to inform both the counts of classified individuals each age class (calf, yearling, adult) and corresponding sex ratios from each camera trap observation.
Using binomial distributions, as opposed to a multinomial distribution, allowed us to account for individuals that were classified by age, but not by sex.
The probabilities for each of the binomial draws were informed by the estimated proportions of individuals in each age and sex class in the population on a given date, which was modeled using a Birth-Age-Survival (BAS) subprocess formulation of a population projection model [@newmanmodelling2014].

For example, the count of calves at the $i^{th}$ camera trap observation was modeled as follows: 

$$C_i \sim \text{Binomial}(N_i, p_{C_i})$$

where $C_i$ is the number of calves, $N_i$ is the total group size, and $p_{C_i}$ is the sum of the expected proportions of male and female calves on the date of the $i^{th}$ observation.

The sex ratio of calves was modeled as follows:

$$F0_i \sim \text{Binomial}\Biggl(F0_i + M0_i, \frac{p_{F0_i}}{p_{F0_i} + p_{M0_i}}\Biggr)$$

where $F0_i$ is the number of female calves, $M0_i$ is the number of male calves, and $p_{F0_i}$ and $p_{M0_i}$ are the expected proportion of female and male calves on the date of the $i^{th}$ observation, respectively.

The model also estimated the fecundity rate, the proportion of fecund cows aged two and older, the annually-varying survival rates for each class, and produced derived estimates of several key population ratios (Fig. 2).
The information from the aerial surveys was integrated into the model, helping inform the total number of individuals (i.e., the sum of the class-wise abundances) and the proportion of calves (i.e., $p_{F0_i} + p_{M0_i}$) on the dates of the aerial surveys.
A Gaussian process regression [@mcelreath2016] accounted for the spatial and temporal correlation of the camera trap observations.
Collectively, these methods could be applied non-invasively to a wide array of hard-to-survey species to estimate key parameters driving population dynamics.

![*Runbisonpic app prediction plot example, showing estimated population ratios for the Ronald Lake Wood Bison herd, by study year. M0 and F0 are male and female calves, M1 and F1 are male and female yearlings, Calf and Yearling represent all individuals within those age classes including those with unknown sex, M2 and M3 represent male two- and three-year-olds, MA represents males aged four and older, and FA represents females aged two and older.* \label{fig:modelplot}](model-plot.png)

This method is implemented using four related R packages.
The underlying functionality to check, clean, process, model, and visualize data is provided by `bisonpictools`.
The other two packages are R shiny apps that provide a user-friendly interface to `bisonpictools`.
Each app starts with an upload data tab that allows users to upload their data and runs a series of checks to ensure the data follows the required format for the next steps.
The first app is `shinybisonpic`, a web-based app that allows users to explore data by viewing camera locations on a map in one tab and plots of ratios of selected sex-age groups by location and year (e.g., Fig. 1) in another tab. 
The second app is `runbisonpic`, a locally-run app that allows users with various skill levels to run the model to estimate the abundance by class, total abundance, survival and fecundity rates, and various sex-age ratios (e.g., Fig. 2). 
To run the model users select the thinning amount before pressing the run button in the run model tab and then can explore the results as tables and plots in the results tab.
Both apps have a help and about tab to provide instructions for users. 
The `bisonpicsuite` package loads the three packages.

![*Bisonpicsuite package structure* \label{fig:packageoverview}](bisonpic_suite.png)

# Limitations

- The model can take over 5 hours to run.
- Key assumptions of the integrated population model include:
  - There is no grouping structure beyond what is accounted for by the covariance.
  - Every stage is equally detectable during a camera trap event.
  - Small and large groups are equally detectable.

# Acknowledgements

This work was funded by Alberta Environment and Protected Areas.
We thank Troy Hegel, Joe Thorley, and John Boulanger for senior review.

# References
