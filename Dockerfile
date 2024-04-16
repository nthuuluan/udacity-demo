FROM python:3.10-slim-buster

# Install Postgres and configure a username + password
USER root

ARG DB_USERNAME=$DB_USERNAME
ARG DB_PASSWORD=$DB_PASSWORD


USER root

WORKDIR /src

COPY ./analytics/requirements.txt requirements.txt

# Dependencies are installed during build time in the container itself so we don't have OS mismatch
RUN pip install -r requirements.txt

COPY ./analytics .

# Start the database and Flask application
CMD python app.py
