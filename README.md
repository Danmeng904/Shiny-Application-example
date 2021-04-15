# Shiny-Application-example
This Shiny application is for the regression of the US personal medical insurance cost  based on the given dataset. In this shiny app, users can implement EDA on the dataset by visualizing and also do linear regression.
## Data Source
The data used in this Shiny app is from [Kaggle](https://www.kaggle.com/). See [this page](https://www.kaggle.com/mirichoi0218/insurance) for more information of this dataset.
#### Brief Data Description
- age: age of primary beneficiary
- sex: insurance contractor gender, female, male
- bmi: body mass index, providing an understanding of body, weights that are relatively high or low relative to height,objective index of body weight (kg / m ^ 2) using the ratio of height to weight, ideally 18.5 to 24.9
- children: number of children covered by health insurance / number of dependents
- smoker: smoke or not
- region: the beneficiary's residential area in the US, northeast, southeast, southwest, northwest.
- charges: Individual medical costs billed by health insurance, dependent variable.
## To Run the app
1. Users may download the app with the dataset locally and simply open the app.R file in RStudio and click the Run App button.
2. The app can also be run with the following command after loading 'shiny' library in RStudio:
`runGitHub("Shiny-Application-example", "Danmeng904", ref = "main" )`
- Users may modify the file name and directory if downloading this app and running locally.
## How to use this app
In EDA, users may choose to see the visualization of either numerical or categorical independent variables by clicking on the tags, and then pleaseselect one variable using the select box. When variable is chosen, please click on "Plot" button to see the plots. Numerical variables are shown by scatterplots while categorical by boxplots.

By clicking on "Linear Regression Summary" button, users would see the summary of the linear regression result.

Any correction and suggestion are welcomed.
