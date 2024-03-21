import pandas as pd 
import numpy as np 
import pickle 
import streamlit as st 
from PIL import Image 

# loading in the model to predict on the data 
pickle_in = open('parkinsons_model.pkl', 'rb') 
classifier = pickle.load(pickle_in) 

def welcome(): 
	return 'welcome all'

# defining the function which will make the prediction using 
# the data which the user inputs 
def prediction(sepal_length, sepal_width, petal_length, petal_width): 

	prediction = classifier.predict( 
		[[sepal_length, sepal_width, petal_length, petal_width]]) 
	print(prediction) 
	return prediction 
	

# this is the main function in which we define our webpage 
def main(): 
	# giving the webpage a title 
	st.title("Iris Flower Prediction") 
	
	# here we define some of the front end elements of the web page like 
	# the font and background color, the padding and the text to be displayed 
	html_temp = """ 
	<div style ="background-color:yellow;padding:13px"> 
	<h1 style ="color:black;text-align:center;">Streamlit Iris Flower Classifier ML App </h1> 
	</div> 
	"""
	
	# this line allows us to display the front end aspects we have 
	# defined in the above code 
	st.markdown(html_temp, unsafe_allow_html = True) 
	
	# the following lines create text boxes in which the user can enter 
	# the data required to make the prediction 
	sepal_length = st.text_input("Sepal Length", "Type Here") 
	sepal_width = st.text_input("Sepal Width", "Type Here") 
	petal_length = st.text_input("Petal Length", "Type Here") 
	petal_width = st.text_input("Petal Width", "Type Here") 
	result ="" 
	
	# the below line ensures that when the button called 'Predict' is clicked, 
	# the prediction function defined above is called to make the prediction 
	# and store it in the variable result 
	if st.button("Predict"): 
		result = prediction(sepal_length, sepal_width, petal_length, petal_width) 
	st.success('The output is {}'.format(result)) 
	
if __name__=='__main__': 
	main() 
