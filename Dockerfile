FROM fkrull/multi-python:latest

WORKDIR /app

RUN pip3 install pytest mypy

COPY . .

ADD com.sh /

RUN chmod +x /com.sh

CMD ["/com.sh"]
