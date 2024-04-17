FROM python:3.7-slim:latest

WORKDIR /app

ADD . /app

RUN apt-get update && apt-get upgrade -y
RUN pip install -r requirements.txt
RUN pip install --upgrade pip

EXPOSE 8080

# execute the Flask app
ENTRYPOINT ["python"]
HEALTHCHECK CMD curl --fail http://localhost:8080/ || exit 1
CMD ["/app/app.py"]
