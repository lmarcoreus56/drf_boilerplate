FROM python:3.9


#Install SSH client 
RUN apt-get update && apt-get install -y openssh-client

#set environment variables 
ENV PYTHONUNBUFFERED 1

# Set the working directory 
WORKDIR /app

#Copy requirement.txt file zzs
COPY requirements.txt /app/requirements.txt

#install python dependencies 
RUN pip install -r requirements.txt

#Copy the application to the working directory 
COPY . /app 

#start the SSH tunnel 
CMD python manage.py runserver 0.0.0.0:8000
