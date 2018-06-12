FROM openkbs/jdk-mvn-py3-x11

MAINTAINER DrSnowbird "DrSnowbird@openkbs.org"

#### ---- USER_NAME is defined in parent image: openkbs/jdk-mvn-py3-x11 already ----
ENV USER_NAME=${USER_NAME:-developer}
ENV HOME=/home/${USER_NAME}

#### ---- Build Specification ----
# Metadata params
ARG BUILD_DATE=${BUILD_DATE:-}
ARG VERSION=${BUILD_DATE:-}
ARG VCS_REF=${BUILD_DATE:-}

#### ---- Product Specifications ----
ARG PRODUCT=${PRODUCT:-}
ARG PRODUCT_VERSION=${PRODUCT_VERSION:-}
ARG PRODUCT_URL=${PRODUCT_URL:-}
ARG PRODUCT_TAR=${PRODUCT_TAR:-}
ARG PRODUCT_DIR=${PRODUCT_DIR:-}
ARG PRODUCT_EXE=${PRODUCT_EXE:-}

ENV PRODUCT=${PRODUCT}
ENV PRODUCT_VERSION=${PRODUCT_VERSION}
ENV PRODUCT_URL=${PRODUCT_URL:-}
ENV PRODUCT_TAR=${PRODUCT_TAR:-}
ENV PRODUCT_DIR=${PRODUCT_DIR}
ENV PRODUCT_EXE=${PRODUCT_EXE}

# Metadata
LABEL org.label-schema.url="https://imagelayers.io" \
      org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.version=$VERSION \
      org.label-schema.vcs-url="https://github.com/microscaling/imagelayers-graph.git" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.docker.dockerfile="/Dockerfile" \
      org.label-schema.description="This utility provides a docker template files for building Docker." \
      org.label-schema.schema-version="1.0"


#### ---- Neural Designer ----
#### Ref: https://www.neuraldesigner.com/
####   The input to Neural Editor is a data file that can be taken from a file (csv, txt, dat, etc) or 
####   from a database (MYSQL, SQL Lite, Oracle, etc). 
#### 

WORKDIR /opt
RUN wget -c ${PRODUCT_URL} 
RUN sudo apt-get install -y qt4-dev-tools && \
    sudo sudo dpkg -i ./$(basename ${PRODUCT_URL}) && \
    rm $(basename ${PRODUCT_URL}) 

#RUN mkdir -p ${HOME}/.eclipse ${ECLIPSE_WORKSPACE} &&\
#    chown -R ${USER_NAME}:${USER_NAME} ${ECLIPSE_WORKSPACE} ${HOME}/.eclipse
    
USER ${USER_NAME}
WORKDIR ${HOME}

RUN echo $HOME
CMD "${PRODUCT_EXE}"

