FROM python:3.10

WORKDIR /app

ADD . /app


RUN pip install --quiet --requirement requirements.txt


EXPOSE 8080

# execute the Flask app
ENTRYPOINT ["python"]
HEALTHCHECK CMD curl --fail http://localhost:8080/ || exit 1
CMD ["/app/app.py"]
