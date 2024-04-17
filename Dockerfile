FROM python:3.7-slim

WORKDIR /app

ADD . /app


RUN pip install --upgrade pip
RUN pip install --upgrade Flask
RUN pip install -r requirements.txt


EXPOSE 8080

# execute the Flask app
ENTRYPOINT ["python"]
HEALTHCHECK CMD curl --fail http://localhost:8080/ || exit 1
CMD ["/app/app.py"]
