# Diabetes Prediction Using SVM Model

## Project Overview
This project involves building a machine learning model to predict diabetes based on various health metrics using the PIMA Diabetes dataset. The dataset consists of medical information from 768 patients, with features such as pregnancies, glucose levels, blood pressure, skin thickness, insulin levels, BMI, diabetes pedigree function, and age. The goal is to classify patients as diabetic or non-diabetic.

## Key Steps and Methods

### Data Collection and Exploration
- Loaded the PIMA Diabetes dataset containing 768 samples with 8 features and a target label (Outcome).
- Explored the data distribution and computed statistical measures.

### Data Preprocessing
- Handled missing values and standardized the dataset using `StandardScaler` to ensure all features contribute equally to the model.
- Split the dataset into training (80%) and testing (20%) sets, maintaining the proportion of diabetic and non-diabetic cases using stratified sampling.

### Model Building
- Implemented a Support Vector Machine (SVM) classifier with a linear kernel.
- Trained the model on the standardized training data.

### Model Evaluation
- Achieved an accuracy score of **78.66%** on the training data and **77.27%** on the testing data.
- Evaluated the model's performance to ensure generalizability and robustness.

### Predictive System
- Developed a predictive system that takes in new patient data, processes it using the same standardization, and predicts whether the patient is diabetic.

## Example Code Snippet

```python
# Making a Predictive System
input_data = (5, 166, 72, 19, 175, 25.8, 0.587, 51)
input_data_as_numpy_array = np.asarray(input_data)
input_data_reshaped = input_data_as_numpy_array.reshape(1, -1)

# Standardizing the input data
std_data = scaler.transform(input_data_reshaped)
prediction = classifier.predict(std_data)

if prediction[0] == 0:
    print('The person is not diabetic')
else:
    print('The person is diabetic')
