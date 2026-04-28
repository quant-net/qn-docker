FROM nikolaik/python-nodejs:python3.12-nodejs25-slim AS build

RUN apt-get update && \
    apt-get install --yes --no-install-recommends \
    openssh-client \
    git \
    && apt-get clean

ARG QUANTNET_MQ_VERSION=""
ARG QUANTNET_SERVER_VERSION=""
ARG QUANTNET_API_VERSION=""

RUN pip install --upgrade pip setuptools wheel \
    quantnet-mq${QUANTNET_MQ_VERSION} \
    quantnet-server${QUANTNET_SERVER_VERSION} \
    quantnet-api${QUANTNET_API_VERSION}
RUN git clone --single-branch --branch main https://github.com/quant-net/qn-plugins

CMD ["qn-api"]
