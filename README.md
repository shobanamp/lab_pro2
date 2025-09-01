# Recreate README.txt after reset

readme_text = """AI End-Term Project — CH24M567 (Shobana)
=================================================
Titanic Survival Prediction with Full MLOps Pipeline

-------------------------------------------------
Project Overview
-------------------------------------------------
This project demonstrates a complete MLOps workflow for predicting Titanic passenger survival.
The pipeline includes:
- Data preprocessing & feature engineering with Apache Spark
- Model training & hyperparameter tuning (Logistic Regression, Decision Tree, Random Forest)
- Experiment tracking & model registry using MLflow
- Dataset versioning with DVC
- Deployment of the best model using FastAPI
- Testing the API with sample inputs

-------------------------------------------------
Tools & Technologies
-------------------------------------------------
- Python 3.8+
- Apache Spark
- MLflow (for experiment tracking & registry)
- DVC (for data & pipeline versioning)
- FastAPI + Uvicorn (for deployment)
- Git + GitHub

-------------------------------------------------
Setup Instructions
-------------------------------------------------
1. Clone the repository:
   git clone https://github.com/shobanamp/lab_pro2.git
   cd lab_pro2

2. Create a virtual environment:
   python3 -m venv myenv
   source myenv/bin/activate   # Linux/Mac
   myenv\\Scripts\\activate      # Windows

3. Install dependencies:
   pip install -r requirements.txt

4. Setup DVC (if dataset is tracked):
   dvc init
   dvc pull   # fetch dataset from remote (if configured)

-------------------------------------------------
Running the Project
-------------------------------------------------
Step 1 — Train models with Spark:
   python lab_pro2.py

Step 2 — Start MLflow Tracking UI (in a new terminal):
   mlflow ui --host 0.0.0.0 --port 5000
   Open http://localhost:5000 to explore runs and models.

Step 3 — Deploy the Production Model:
   uvicorn deploy_model:app --host 0.0.0.0 --port 8000
   API will be live at: http://localhost:8000
   Swagger docs: http://localhost:8000/docs

Step 4 — Test the API:
   python test_api.py

   Sample request JSON:
   {
     "Pclass": 3,
     "Age_imputed": 22.0,
     "SibSp": 1,
     "Parch": 0,
     "Fare_imputed": 7.25,
     "SexVec": [1.0, 0.0],
     "EmbarkedVec": [0.0, 1.0, 0.0]
   }

   Expected response:
   {
     "prediction": 0,
     "survival_probability": 0.145
   }

-------------------------------------------------
Repository Structure
-------------------------------------------------
lab_pro2/
├── lab_pro2.py          # Spark training + MLflow logging + registry
├── deploy_model.py      # FastAPI deployment
├── test_api.py          # API testing script
├── requirements.txt     # Python dependencies
├── dvc.yaml             # DVC pipeline definition
├── titanic.csv.dvc      # Dataset tracking file
├── .dvc/                # DVC internals
├── .dvcignore
├── .gitignore
└── README.txt

-------------------------------------------------
Results
-------------------------------------------------
- Best model registered in MLflow Registry → promoted to Production
- Confusion matrices, ROC AUC scores, feature importances logged in MLflow
- FastAPI API serving predictions in real time

-------------------------------------------------
Future Work
-------------------------------------------------
- Add drift detection and automated retraining
- Containerize with Docker for deployment on cloud
- Extend to larger datasets (e.g., MNIST)

-------------------------------------------------
Author
-------------------------------------------------
Shobana (CH24M567)
M.Tech Industrial AI — IIT Madras
"""

# Save as README.txt
file_path = "/mnt/data/README.txt"
with open(file_path, "w") as f:
    f.write(readme_text)

file_path
