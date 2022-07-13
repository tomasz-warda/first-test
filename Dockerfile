FROM fkrull/multi-python:latest

WORKDIR /app

COPY . .

ADD com.sh /

RUN chmod +x /com.sh

CMD ["/com.sh"]
