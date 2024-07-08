# DrylandConnectivityAnalysis
This repository contains MATLAB codes and data used in our research to quantitatively analyze connectivity patterns within grassland and shrubland ecosystems across varying environmental conditions.

Repository Contents
1. A1_network_change.m: Script to analyze changes in network connectivity.
2. A2_global_metric_v2.m: Computes global metrics for version 2 of our analysis.
3. A2_global_metric_v3.m: Computes global metrics for version 3, with updates.
4. A3_FCsediment_node_metric.m: Calculates node metrics for sediment connectivity.
5. A3_FCwater_node_metric.m: Calculates node metrics for water connectivity.
6. A3_SC_node_metric.m: Calculates node metrics for structural connectivity.
7. A4_SCFC_v2.m: Script for analyzing the relationship between structural and functional connectivity.

Data
-MATLAB output files
1. SC_network
2. FC_network_dschg
3. FC_network_sedtr

-Field data of elevation and vegetation cover:
1. p1dem and p4dem
2. p1vegcover and p4vegcover

-modeloutput
1. p1_rain(A/B/C/D/E)_(low/mid/high)sm _dschg/sedtr
2. p1_rain(A/B/C/D/E)_(low/mid/high)sm _dschg/sedtr

where p1 is grass plot and p4 is shrub plot
A,B,C,D and E are five rainfall events with differnt rainfall totals
low/mid/high are three soil moisture conditions
dschg represent total water flow during the rainfall event and sedtr reeprent total sediment transfer.


Prerequisites
The scripts are developed in MATLAB R2023a and require the following toolboxes:

Mapping Toolbox
Statistics and Machine Learning Toolbox
Ensure these toolboxes are installed before running the scripts.

Usage
Each script can be run independently within the MATLAB environment. Set your current folder to the location of the downloaded scripts and execute them directly from the command window or via a script editor.

Contributing
Contributions to this project are welcome. Please fork the repository and submit pull requests with your enhancements. For major changes, please open an issue first to discuss what you would like to change.

License
This project is licensed under the MIT License - see the LICENSE file for details.

Authors
Shubham Tiwari, Laura Turnbull-Llyod and John Wainwright

Acknowledgments
Thanks to all collaborators and i-conn project grant that supported this research.
Special thanks to [Laura Turnbull, Wainwright, Brazier, et al., 2010] and [Laura Turnbull & Wainwright, 2019] for the foundational datasets and discussions that inspired this work.
