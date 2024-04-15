import streamlit as st
import joblib
import numpy as np

# Load the trained machine learning model
model = joblib.load('parkinsons_model.pkl')

# Function to predict Parkinson's disease
def predict_parkinsons(features):
    # Convert input features to a numpy array and reshape it
    features_array = np.array(features).reshape(1, -1)
    # Make prediction
    prediction = model.predict(features_array)
    # Return prediction
    return prediction[0]

# Streamlit web app
def main():
    st.title('Parkinson\'s Disease Prediction')
    st.write('Enter the following parameters to predict Parkinson\'s disease:')
    
    # Input fields for the parameters
    fo_hz = st.number_input('MDVP:Fo(Hz)', value=0.0)
    fhi_hz = st.number_input('MDVP:Fhi(Hz)', value=0.0)
    flo_hz = st.number_input('MDVP:Flo(Hz)', value=0.0)
    jitter_percent = st.number_input('MDVP:Jitter(%)', value=0.0)
    rap = st.number_input('MDVP:RAP', value=0.0)
    ppq = st.number_input('MDVP:PPQ', value=0.0)
    jitter_ddp = st.number_input('Jitter:DDP', value=0.0)
    apq = st.number_input('MDVP:APQ', value=0.0)
    nhr = st.number_input('NHR', value=0.0)
    hnr = st.number_input('HNR', value=0.0)
    rpde = st.number_input('RPDE', value=0.0)
    dfa = st.number_input('DFA', value=0.0)
    spread2 = st.number_input('spread2', value=0.0)
    d2 = st.number_input('D2', value=0.0)
    ppe = st.number_input('PPE', value=0.0)
    
    # Predict button
    if st.button('Predict'):
        # Gather input features
        features = [fo_hz, fhi_hz, flo_hz, jitter_percent, rap, ppq, jitter_ddp, apq, nhr, hnr, rpde, dfa, spread2, d2, ppe]
        # Predict Parkinson's disease
        prediction = predict_parkinsons(features)
        if prediction == 1:
            st.write('Prediction: Parkinson\'s disease - Positive')
        else:
            st.write('Prediction: No Parkinson\'s disease - Negative')

if __name__ == '__main__':
    main()
