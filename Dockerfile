FROM python:3.7-slim

WORKDIR /app

ADD . /app

RUN pip install -r requirements.txt
RUN pip install --upgrade pip

EXPOSE 8080

# execute the Flask app
ENTRYPOINT ["python"]
HEALTHCHECK CMD curl --fail http://localhost:8080/ || exit 1
CMD ["/app/app.py"]
