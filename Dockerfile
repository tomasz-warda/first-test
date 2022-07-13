FROM ubuntu:latest

WORKDIR /app

RUN python3 --version

RUN pip3 install pytest

RUN pip3 install mypy

COPY . .

ADD com.sh /

RUN chmod +x /com.sh

CMD ["/com.sh"]
