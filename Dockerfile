FROM alpine:3.14

ARG RUNNER_VERSION="2.283.3"

RUN apt-get update -y && apt-get upgrade -y && useradd -m docker

RUN cd /home/docker && mkdir actions-runner && cd actions-runner \
    && curl -O -L https://github.com/actions/runner/releases/download/v${RUNNER_VERSION}/actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz \
    && tar xzf ./actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz

RUN chown -R docker ~docker && /home/docker/actions-runner/bin/installdependencies.sh

COPY start.sh start.sh

RUN chmod +x start.sh

USER docker

ENTRYPOINT ["./start.sh"]


WORKDIR /app

RUN pip3 install pytest

RUN pip3 install mypy

COPY . .

ADD com.sh /

RUN chmod +x /com.sh

CMD ["/com.sh"]
