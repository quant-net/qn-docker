FROM python:3.11-slim AS build

RUN apt-get update && \
    apt-get install --yes --no-install-recommends \
    openssh-client \
    git \
    && apt-get clean

ARG QUANTNET_MQ_VERSION=""
ARG QUANTNET_SERVER_VERSION=""

RUN python -m pip install --upgrade pip
RUN pip install quantnet-mq${QUANTNET_MQ_VERSION} quantnet-server${QUANTNET_SERVER_VERSION}

RUN git clone --single-branch --branch main https://github.com/quant-net/qn-plugins.git qn-plugins

COPY docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh
CMD ["quantnet_controller"]
