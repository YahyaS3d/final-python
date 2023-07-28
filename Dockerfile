FROM python:3.7
MAINTAINER Yahya 
WORKDIR /app 
COPY . . 
RUN pip install pipenv && pipenv install --system --deploy
EXPOSE 5000
CMD ["python","app.py"]