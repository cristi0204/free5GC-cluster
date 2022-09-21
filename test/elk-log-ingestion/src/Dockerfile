# Use existing python docker image as a base
FROM python:latest

# Set the working directory
WORKDIR /usr/app/src
# to copy remote script at working dirctory in container
COPY src/logDeliveryAndCheck.py ./
COPY src/main.py ./
COPY src/requirements.txt ./

# Download and install dependency
RUN apt-get update
RUN apt-get install -y vim
RUN pip install -r requirements.txt
#RUN pip install jsons

EXPOSE 4422

# image execute the .py script as it starts as a container
CMD [ "python", "./main.py" ]
