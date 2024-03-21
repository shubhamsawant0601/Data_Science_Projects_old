from flask import Flask, render_template, request
import pandas as pd
import joblib
import pickle

app = Flask(__name__)

@app.route('/')
def home():
    return render_template('index.html')

@app.route('/predict', methods=['POST'])
def predict():
    # Get the input values from the form
    mdvp_fo = float(request.form['mdvp_fo'])
    mdvp_fhi = float(request.form['mdvp_fhi'])
    mdvp_flo = float(request.form['mdvp_flo'])
    mdvp_jitter = float(request.form['mdvp_jitter'])
    mdvp_rap = float(request.form['mdvp_rap'])
    mdvp_ppq = float(request.form['mdvp_ppq'])
    jitter_ddp = float(request.form['jitter_ddp'])
    mdvp_apq = float(request.form['mdvp_apq'])
    nhr = float(request.form['nhr'])
    hnr = float(request.form['hnr'])
    rpde = float(request.form['rpde'])
    dfa = float(request.form['dfa'])
    spread2 = float(request.form['spread2'])
    d2 = float(request.form['d2'])
    ppe = float(request.form['ppe'])
    
    # Create a DataFrame with the input values
    input_data = pd.DataFrame({
        'MDVP:Fo(Hz)': [mdvp_fo],
        'MDVP:Fhi(Hz)': [mdvp_fhi],
        'MDVP:Flo(Hz)': [mdvp_flo],
        'MDVP:Jitter(%)': [mdvp_jitter],
        'MDVP:RAP': [mdvp_rap],
        'MDVP:PPQ': [mdvp_ppq],
        'Jitter:DDP': [jitter_ddp],
        'MDVP:APQ': [mdvp_apq],
        'NHR': [nhr],
        'HNR': [hnr],
        'RPDE': [rpde],
        'DFA': [dfa],
        'spread2': [spread2],
        'D2': [d2],
        'PPE': [ppe]
    })
    
    # Load the trained model
    model = joblib.load('parkinsons_model.pkl')

    # Make prediction
    prediction = model.predict([[mdvp_fo, mdvp_fhi, mdvp_flo, mdvp_jitter, mdvp_rap, mdvp_ppq, jitter_ddp, mdvp_apq, nhr, hnr, rpde, dfa, spread2, d2, ppe]])[0]
    
    # Render the prediction result
    return render_template('result.html', prediction=prediction)

if __name__ == '__main__':
    app.run(debug=True)
