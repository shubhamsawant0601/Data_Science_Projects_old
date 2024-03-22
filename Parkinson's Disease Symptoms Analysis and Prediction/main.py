import streamlit as st
import joblib
import numpy as np
import glob 
st.set_page_config(layout="wide")
# Function to predict Parkinson's disease
def predict_parkinsons(features):
    # Load the trained machine learning model
    model = joblib.load('parkinsons_model.pkl')
    # Convert input features to a numpy array and reshape it
    features_array = np.array(features).reshape(1, -1)
    # Make prediction
    prediction = model.predict(features_array)
    # Return prediction
    return prediction[0]

def home_page():
    # Add header
    st.title('Parkinson\'s Disease Prediction')
    st.write('Welcome to our Parkinson\'s disease prediction app.')
    st.write("Parkinson's disease is a neurodegenerative disorder that affects movement. It is characterized by symptoms such as tremors, stiffness, slowness of movement, and impaired balance and coordination. The disease results from the loss of dopamine-producing cells in the brain.\nNow, let's briefly describe each attribute mentioned in the dataset related to Parkinson's disease:\n1. MDVP:Fo_Hz: Fundamental frequency of the voice, representing the average vocal cord vibration rate.\n2. MDVP:Fhi_Hz: Highest fundamental frequency of the voice observed.\n3. MDVP:Flo_Hz_: Lowest fundamental frequency of the voice observed.\n4. MDVP:Jitter_%_: Variation in the fundamental frequency of the voice, measured as a percentage.\n5. MDVP:RAP: Relative Average Perturbation, which quantifies the rapid changes in the fundamental frequency.\n6. MDVP:PPQ: Five-point period perturbation quotient, a measure of the period perturbation of the voice signal.\n7. Jitter:DDP: Jitter _MDVP_RAP is doubled, representing the average absolute difference of differences between consecutive periods.\n8. MDVP:APQ: Five-point amplitude perturbation quotient, a measure of the amplitude perturbation of the voice signal.\n9. NHR: Noise-to-Harmonics Ratio, representing the ratio of noise to harmonics in the voice signal.\n10. HNR: Harmonics-to-Noise Ratio, representing the ratio of harmonics to noise in the voice signal.\n11. RPDE: Recurrence Period Density Entropy, a measure of the complexity of the voice signal.\n12. DFA: Detrended Fluctuation Analysis, quantifying the presence of long-term correlations in the voice signal.\n13. spread2: Nonlinear measure of fundamental frequency variation.\n14. D2: Correlation dimension, a measure of the complexity of the voice signal.\n15. PPE: Pitch Period Entropy, representing the disorder and unpredictability of the voice signal.\nThese attributes are often used as features in machine learning models to predict the presence or progression of Parkinson's disease based on voice recordings. They provide inshghts into the characteristics of the voice signal and can help in diagnosing and monitoring the disease.")
 

    # Add instructions
    st.write('Please enter the following parameters to predict Parkinson\'s disease:')
    
    # Arrange input fields in horizontal lines
    col1, col2, col3 = st.columns(3)
    
    # Input fields for the parameters (arranged in columns)
    with col1:
    	spread2 = st.number_input('spread2', value=0.0)
    	fo_hz = st.number_input('MDVP:Fo_Hz_', value=0.0)
    	fhi_hz = st.number_input('MDVP:Fhi_Hz_', value=0.0)
    	flo_hz = st.number_input('MDVP:Flo_Hz_', value=0.0)
    	jitter_percent = st.number_input('MDVP:Jitter_%_', value=0.0)

    with col2:
    	rap = st.number_input('MDVP:RAP', value=0.0)
    	ppq = st.number_input('MDVP:PPQ', value=0.0)
    	jitter_ddp = st.number_input('Jitter:DDP', value=0.0)
    	apq = st.number_input('MDVP:APQ', value=0.0)
    	ppe = st.number_input('PPE', value=0.0)
    
    with col3:
    	nhr = st.number_input('NHR', value=0.0)
    	hnr = st.number_input('HNR', value=0.0)
    	rpde = st.number_input('RPDE', value=0.0)
    	dfa = st.number_input('DFA', value=0.0)
    	d2 = st.number_input('D2', value=0.0)

    
    # Predict button
    if st.button('Predict'):
        # Gather input features
        features = [fo_hz, fhi_hz, flo_hz, jitter_percent, rap, ppq, jitter_ddp, apq, nhr, hnr, rpde, dfa, spread2, d2, ppe]
        # Predict Parkinson's disease
        prediction = predict_parkinsons(features)
        if prediction == 1:
            st.success('Prediction: Parkinson\'s disease - Positive')
        else:
            st.success('Prediction: No Parkinson\'s disease - Negative')

def function_data_science_lifecycle_page():
   
    page_selection = st.sidebar.radio("Go to", [i.replace(".html", "") for i in glob.glob("*.html")])

    with open(page_selection + ".html", "r") as f:
            html_content = f.read()
    st.components.v1.html(html_content, width=1000, height=1000000, scrolling=True)


def function_sql_server_queries_page():
    st.title('SQL Server Code for Analysis Using SQL Queries')

    # Read SQL code from .sql file
    with open('SQL Server Queries for Data Analysis.sql', 'r') as file:
        sql_code = file.read()
    
    st.code(sql_code, language='sql')


def function_power_bi_dashboard_page():
    st.title('Power-Bi Dashboard Analysis')
    # Display PNG file
    image = open("Dashoboard Pic.png", "rb").read()
    st.image(image, caption='Power-Bi Dashboard', use_column_width=True)

def main():
    st.sidebar.title('Navigation')
    page_selection = st.sidebar.radio("Go to", ["Home", "Data Science Lifecycle", "SQL Server Queries", "Power-Bi Dashboard"])

    if page_selection == "Home":
        home_page()
    elif page_selection == "Data Science Lifecycle":
        function_data_science_lifecycle_page()
    elif page_selection == "SQL Server Queries":
        function_sql_server_queries_page()
    elif page_selection == "Power-Bi Dashboard":
        function_power_bi_dashboard_page()

if __name__ == '__main__':
    main()