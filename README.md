# Integrated-optimization-of-production-and-transportation-of-organic-products-in-polyhouse-farming
We carry out two-phase heuristics to integrate optimization of the production and transportation of organic products. 
Dependencies to be installed to run the model:

Anaconda (Jupyter Notebook) 

Import all python modules in Anaconda environment or Jupyter notebook associated with the code ( os module , amplpy module , pyomo module , itertools module , time module , and pandas module )

Gurobi software

AMPL software

Description of running code:

Download the "model.mod" file from repository and save it in a desired location

Download all the desired data file (dat file) and save it in desired location. 

Eg. Pol200v4.dat means dat file which consist data of 200nodes and 4 different transport modes are available at each polyhouse region.

# Open the "Two-phase model.ipynb" in jupyter notebook , to solve first phase: 

add the AMPL software folder path first

add the location for temporary directory

Input the location of "model.mod" file in "ampl.read" command

Input the desired dat file eg. "Pol200v4" in  ampl.readData command and solve the first phase of the model.

We Create a necessary dictionary in which for each polyhouse region i and transportation mode k, we save the DCs j where product going to be transported. 

# To solve second phase:

Download "DistanceBig.dat" file if running either of three case studies (Pol32.dat, Pol75.dat, Pol125.dat) 

Download "DistancePol.dat" file if running other case studies

Put this file in desired location and input the file location in data.load command in section [3] of the "Two-phase model.ipynb" code file and run all the section.

Save the result in desired location using pandas dataframe command.

