# Enable Buildkit and run
# DOCKER_BUILDKIT=1 docker build --progress=plain --ssh default=$HOME/.ssh/name_of_your_ssh_key .

FROM python:3.9-slim as build

ARG NETSQUID_USER
ARG NETSQUID_PASS

ENV NETSQUID_USER=${NETSQUID_USER}
ENV NETSQUID_PASS=${NETSQUID_PASS}

RUN apt-get update && \
    apt-get install --yes --no-install-recommends \
    openssh-client \ 
    git \
    && apt-get clean

RUN pip install --upgrade pip && \
    python -m pip install --user --extra-index-url https://${NETSQUID_USER}:${NETSQUID_PASS}@pypi.netsquid.org netsquid

#RUN mkdir -p -m 0600 ~/.ssh && \
#    ssh-keyscan -H github.com >> ~/.ssh/known_hosts

#RUN --mount=type=ssh \
#    git clone --single-branch --branch dev-lzhang9 git@github.com:quant-net/quant-net-sim.git && \
#    cd quant-net-sim && pip install -r requirements_dev.txt && python setup.py install

COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["/bin/bash"]
