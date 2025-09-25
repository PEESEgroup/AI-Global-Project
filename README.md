# AI-Global-Project
This study investigates exploratory pathways to evaluate the global energy and climate implications of AI infrastructure expansion, highlighting how future electricity demand and emissions may evolve. It further evaluates strategic interventions to identify cost-optimal technology portfolios for aligning AI growth with climate mitigation objectives. The following contents are included in this repository to support our key findings:
-	Codes: include all codes to evaluate the exploratory pathways.
-	Data: include all data used during the analysis.
## Data Files
The repository provides country-level data and scenario-specific parameters used in the modeling framework. The contents include:
-	Climate and data center performance data: Country-specific climate profiles (country_name_raw_data.xlsx) at hourly resolution to evaluate the data center power usage effectiveness (PUE) (inp_pue).
-	Renewable generation profiles: Solar radiation (country_name_srd.xlsx) and wind speed data (country_name_wsp.xlsx) across countries, used to characterize the availability of on-site renewable power for data center operations.
-	Adoption modeling inputs: Calibration dataset for the generalized Bass model (inp_gbm.xlsx), parameterizing AI infrastructure adoption under different CoWoS packaging and peak deployment scenarios.
-	Intervention pathway definitions: Linear reduction factors for carbon intensity of electricity supply (inp_lrf_RP_25, inp_lrf_RP_50, inp_lrf_RP_75, inp_lrf_CN) and proportional land-use budget increases for on-site renewable deployment (inp_lif_RP_25, inp_lif_RP_50, inp_lif_RP_75, inp_lif_CN).
-	Climate pathway parameters: Country-level carbon intensities (inp_ci_SSP1_19, inp_ci_SSP2_45, inp_ci_SSP5_60) and land-use intensity factors (inp_lu_SSP1_19, inp_lu_SSP2_45, inp_lu_SSP5_60) for SSP1-19, SSP2-45, and SSP5-60, enabling assessment across different decarbonization contexts.
-	Technology cost projections: Cost datasets for solar power (inp_solar_cpx.xlsx, inp_solar_opx.xlsx), wind power (inp_wind_cpx.xlsx, inp_wind_opx.xlsx), battery storage and interface systems (inp_bst_cpx.xlsx, inp_bst_opx.xlsx, inp_bit_cpx.xlsx, inp_bit_opx.xlsx), DAC systems (inp_dac_cpx.xlsx), heat pumps (inp_hp_cpx.xlsx), and country-specific electricity prices (inp_ele_price.xlsx).
## Code files
The repository includes code files used to implement the scenario-based modeling framework developed in this study. These codes reflect the different modules of the analysis:
-	Data center performance evaluation: AI_global_PUE evaluates power usage effectiveness (PUE) for data center operations across countries, based on hourly climate inputs.
-	Adoption modeling: AI_global_gbm_peak2031, AI_global_gbm_peak2033, AI_global_gbm_peak2035 implement the generalized Bass model to project AI infrastructure adoption under alternative peak market growth scenarios.
-	Intervention pathways: AI_global_int._RP_25, AI_global_int._RP_50, AI_global_int._RP_75, AI_global_int._CN optimize technology portfolios for AI data centers under intervention pathways.
## Citation
Please use the following citation when using the data, methods or results of this work:
> Lal, A. and You, F. Reconciling AI Proliferation with Climate through Exploratory Pathways. Submitted to Nature Climate Change.

