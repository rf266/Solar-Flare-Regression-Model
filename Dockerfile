FROM python:3.12.11

ADD EDA.ipynb .
ADD app.py .
ADD poisson_model.pkl . 
ADD ui.py .

RUN pip install requirements.txt

CMD [ "python", "./app.py", "./ui.py" ]