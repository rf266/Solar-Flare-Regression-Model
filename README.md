## End to End Solar-Flare-Regression-Model

The purpose of this model is to predict the expected/mean number of solar flares of common, moderate and severe intensity in a 24H period, from data about the sunspot being studied. Throughout the process, I have consulted a wide range of online resources and AI tools to facilitate the process and learn the process of creating an end-to-end model, although the premise of the project is quite simple. The final model uses Poisson Regression to predict values for each flare class. 

# Tech stack: 
- Pandas and Scikit-learn for model building and Exploratory Data Analysis (Matplotlib and Seaborn were also used for support in visualisation but are omitted from the final notebook)
- Joblib model saving/pickling
- Streamlit UI/frontend
- FastAPI, Pydantic, Uvicorn and Requests backend 
- Vercel Deployment 

(My original intentions were to containerise the model using Docker, as this would be an added learning opportunity. However, due to my system's repeated compatibility issues with Docker, I had to skip this step. )

# Stages of completion (non-chronological)

1. Exploratory Data Analysis 

The data used is from UCI's Machine Learning Repository, describing the various features of a sunspot and how these translated to common, moderate and severe solar flares. Having 3 target classes was a point of challenge, which I was able to acknowledge whilst having to choose models to train. The model contained features that were not numerical - modified Zurich class, largest spot size and spot distribution, classed by letter according to scientific classifications. Initially, I decided to map the values to corresponding integers, as these categories seemed somewhat ranked in intensity of a solar flare. However, after training several models (more details below), the scores produced were questionable, as according to online and AI tools, models tend to see mapped integers as having a linear relationship, which was not exactly true for sunspot classification. Hence, I switched my approach to using one-hot encoding, despite the increase in the number of columns.

2. Model Training and Testing

My initial thoughts were to compare the performance of three sklearn models to be able to choose the most accurate one, after hyperparameter tuning. I had chosen the RandomForestRegressor, RidgeRegression and KNearestRegressor models, due to their capabilities in handling multi-output regression. I used GridSearchCV for RandomForest and KNearestResgressor, and RidgeCV for RidgeRegression to tune and cross validate for the best set of hyperparameters for each model. One challenge faced here was the presence of memory issues, where not every hyperparameter was tuned, and kernal crashes meant that I had to leave out some hyperparameters. These were scored based on the negative mean squared error 





## Key Sources and References which were especially helpful throughout - not an exhaustive list: 
https://www.youtube.com/watch?v=luJ64trcCwc - reference to overall structure of an end to end ML project 

https://www.kaggle.com/datasets/stealthtechnologies/solar-flares-dataset - dataset - source - UCI ML Repo 

https://www.youtube.com/watch?v=xi0vhXFPegw - EDA walkthrough 

https://www.aavso.org/zurich-classification-system-sunspot-groups - Zurich Classification of sunspot groups 

https://www.stce.be/educational/classification - McIntosh classification system for sunspots 

Pandas Documentation, sklearn documenetation , streamlit documentation

https://www.geeksforgeeks.org/pandas/pandas-replace-multiple-values-in-python/

https://medium.com/@fraidoonomarzai99/hyperparameters-tunning-and-cross-validation-in-depth-d0918b62d986 - CV and Hyperparameter tuning 

Details for variable information- https://archive.ics.uci.edu/dataset/89/solar+flare - according to the authors, the dataset is intended for the purpose of predicting the number of each type of solar flare in a particular 24H period. 

https://www.youtube.com/watch?v=wwfCZz3VKlY - gridsearch

https://www.geeksforgeeks.org/machine-learning/multioutput-regression-in-machine-learning/ - multi output regression

https://stackoverflow.com/questions/71276813/difference-between-ridgecv-and-gridsearchcv - ridge cv vs grid search cv
 
https://developers.google.com/machine-learning/crash-course/classification/accuracy-precision-recall ml metrics 

https://medium.com/@faheemsiddiqi789/how-can-i-determine-if-my-data-is-balanced-or-imbalanced-080819af408c - class 
imbalance

https://stackoverflow.com/questions/54953967/your-session-crashed-after-using-all-available-ram-in-google-collab kernal/ram crashes

https://stackoverflow.com/questions/72101295/python-gridsearchcv-taking-too-long-to-finish-running time

https://scikit-learn.org/stable/model_persistence.html - model persistence

https://www.youtube.com/watch?v=-WfuEJfItjY - joblib

https://www.youtube.com/watch?v=c1n5iCMzr9E - streamlit

https://www.youtube.com/watch?v=ZnDmTGgYMn0 fast api

https://datascience.stackexchange.com/questions/124959/use-prediction-after-using-get-dummies-in-pandas get dummies

https://www.geeksforgeeks.org/machine-learning/deploying-ml-models-as-api-using-fastapi/ - fastapi

https://testdriven.io/blog/fastapi-streamlit/ - fastapi 

https://stackoverflow.com/questions/73326689/fastapi-post-error-422-detail-locbody-file-msgfield-required - error messages

https://stats.stackexchange.com/questions/203872/what-to-do-when-a-linear-regression-gives-negative-estimates-which-are-not-possi - linear reg

https://stats.stackexchange.com/questions/160180/regression-models-to-only-predict-integers-instead-of-floating-point-numbers  - int

https://www.statology.org/a-beginners-guide-to-generalized-linear-models-glms/ - glms

https://stackoverflow.com/questions/43532811/gridsearch-over-multioutputregressor - Gridsearch over MOR

https://stackoverflow.com/questions/49416697/statsmodel-poisson-prediction-return-floats-instead-of-whole-numbers 

https://medium.com/@hannah.hj.do/interpreting-poisson-regression-125f016c1aa6 - poisson

https://stackoverflow.com/questions/79867833/what-does-poissonregression-predict-actually-return-in-sklearn/79867987#79867987 - I asked a question on SO about what is being returned by the poisson reg model, and if I can directly use the output values. 

https://stackoverflow.com/questions/62658215/convergencewarning-lbfgs-failed-to-converge-status-1-stop-total-no-of-iter poisson conv 

https://www.geeksforgeeks.org/pandas/add-column-names-to-dataframe-in-pandas/ - columns in df

https://leapcell.io/blog/how-to-use-python-requests-for-post-requests - interpret output

https://stackoverflow.com/questions/79870602/docker-workaround-for-macos-12 - Question I posted about Docker workarounds