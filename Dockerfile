FROM python:3.8-slim-buster

WORKDIR /app

RUN pip3 install pytest

COPY . .

CMD [ "pytest" ]