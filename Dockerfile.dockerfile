Dockerfile 
# use Python official base image 
FROM Python:3.8.18

# Set environment variables
ENV PYTHONDONTWRITEBYCODE 1
ENV PYTHONUNBUFFERED 1

# set the working directry in the container
WORKDIR /code

# copy the requirement file into the container at /code/
COPY requirement.txt /code/

# install  any needed packages specified in requirement.txt
RUN pip install --upgrade pip && \
    pip install -r requirement.txt

# copy the current directory contents into the container at /code/
COPY . /code/

# collect static files
ENTRYPOINT ["sh", "docker.sh"]

EXPOSE 8000