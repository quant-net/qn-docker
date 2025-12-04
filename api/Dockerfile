# Enable Buildkit and run
# DOCKER_BUILDKIT=1 docker build --progress=plain --ssh default=$HOME/.ssh/name_of_your_ssh_key .

FROM python:3.10-slim as build

RUN apt-get update && \
    apt-get install --yes --no-install-recommends \
    openssh-client \ 
    git \
    && apt-get clean

RUN mkdir -p -m 0600 ~/.ssh && \
    ssh-keyscan -H github.com >> ~/.ssh/known_hosts

# Set environment variable for GitLab Package Registry authentication
# ARG PIP_EXTRA_INDEX_URL
# ENV PIP_EXTRA_INDEX_URL=${PIP_EXTRA_INDEX_URL}

RUN --mount=type=ssh \
    git clone --single-branch --branch develop git@github.com:quant-net/quant-net-mq quantnet_mq && \
    cd quantnet_mq &&  \
    pip install --no-cache-dir -r requirements.txt && python setup.py install

RUN --mount=type=ssh \
    git clone --single-branch --branch develop git@github.com:quant-net/quant-net-server quant-net-server && \
    cd quant-net-server &&  \
    pip install --no-cache-dir -r requirements.txt && python setup.py install

RUN --mount=type=ssh \
    git clone --single-branch --branch develop git@github.com:quant-net/quant-net-tutorials.git quant-net-tutorials

RUN --mount=type=ssh \
    git clone --single-branch --branch develop git@github.com:quant-net/quant-net-api.git && \
    cd quant-net-api && pip install -r requirements.txt

# COPY docker-entrypoint.sh /

# ENTRYPOINT ["/docker-entrypoint.sh"]
WORKDIR /quant-net-api

CMD ["python", "main.py"]
