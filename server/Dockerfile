# Enable Buildkit and run
# DOCKER_BUILDKIT=1 docker build --progress=plain --ssh default=$HOME/.ssh/name_of_your_ssh_key .

FROM python:3.11-slim AS build

RUN apt-get update && \
    apt-get install --yes --no-install-recommends \
    openssh-client \ 
    git \
    && apt-get clean

# RUN mkdir -p -m 0600 ~/.ssh && \
#     ssh-keyscan -H github.com >> ~/.ssh/known_hosts

# RUN --mount=type=ssh \
#     git clone --single-branch --branch main git@github.com:quant-net/qn-mq.git qn-mq && \
#     cd qn-mq && pip install .

# RUN --mount=type=ssh \
#     git clone --single-branch --branch main git@github.com:quant-net/qn-server.git qn-server && \
#     cd qn-server && pip install .

# Update pip
RUN python -m pip install --upgrade pip
RUN pip install quantnet-mq quantnet-server

RUN git clone --single-branch --branch main https://github.com/quant-net/qn-plugins.git qn-plugins

COPY docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh
CMD ["quantnet_controller"]
