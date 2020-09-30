FROM ubuntu:20.04

ENV REPRO_NAME  cpr
ENV REPRO_MNT   /mnt/${REPRO_NAME}
ENV REPRO_USER  repro
ENV REPRO_UID   1000
ENV REPRO_GID   1000

RUN echo '***** Update packages *****'                                      \
    && apt-get -y update

RUN echo '***** Set timezone noninteractively install JDK8 *****'
RUN DEBIAN_FRONTEND="noninteractive" TZ="America/Los_Angeles"               \
    apt -y install tzdata openjdk-8-jdk

RUN echo '***** Install packages required for creating this image *****'    \
    && apt -y install apt-utils wget curl makepasswd gcc make git           \
                                                                            \
    && echo '***** Install command-line utility packages *****'             \
    && apt -y install sudo man less file tree jq graphviz libxml2-utils

ENV GO_VERSION       1.13.5
ENV GO_DOWNLOADS_URL https://dl.google.com/go
ENV GO_ARCHIVE       go${GO_VERSION}.linux-amd64.tar.gz

RUN echo '****** Install Go development tools *****'                        \
    && wget ${GO_DOWNLOADS_URL}/${GO_ARCHIVE} -O /tmp/${GO_ARCHIVE}         \
    && tar -xzf /tmp/${GO_ARCHIVE} -C /usr/local

RUN echo '***** Add the REPRO user and group *****'                         \
    && groupadd ${REPRO_USER} --gid ${REPRO_GID}                            \
    && useradd ${REPRO_USER} --uid ${REPRO_UID} --gid ${REPRO_GID}          \
        --shell /bin/bash                                                   \
        --create-home                                                       \
        -p `echo repro | makepasswd --crypt-md5 --clearfrom - | cut -b8-`   \
    && echo "${REPRO_USER} ALL=(ALL) NOPASSWD: ALL"                         \
            > /etc/sudoers.d/${REPRO_USER}                                  \
    && chmod 0440 /etc/sudoers.d/repro

ENV HOME /home/${REPRO_USER}
ENV USER_BIN ${HOME}/bin
ENV BASHRC ${HOME}/.bashrc
USER  ${REPRO_USER}

WORKDIR $HOME

RUN echo '***** Make the user bin directory *****'                          \
    && mkdir ${USER_BIN}

ENV GEIST_VERSION v0.1.1
ENV GEIST_RELEASES https://github.com/cirss/geist/releases
ENV GEIST_DOWNLOAD_DIR ${GEIST_RELEASES}/download/${GEIST_VERSION}
ENV GEIST_DOWNLOAD_URL ${GEIST_DOWNLOAD_DIR}/blazegraph
ENV GEIST_BINARY ${USER_BIN}/blazegraph

RUN echo '***** Install Geist in user bin directory *****'                  \
    && wget -O ${GEIST_BINARY} ${GEIST_DOWNLOAD_URL}                        \
    && chmod u+x ${GEIST_BINARY}

ENV REPROZIP_VERSION v1.0.16-r1
ENV REPROZIP_RELEASES https://github.com/cirss/reprozip-static/releases
ENV REPROZIP_DOWNLOAD_DIR ${REPROZIP_RELEASES}/download/${REPROZIP_VERSION}
ENV REPROZIP_DOWNLOAD_URL ${REPROZIP_DOWNLOAD_DIR}/reprozip-1.016-linux-x86-64-static
ENV REPROZIP_BINARY ${USER_BIN}/reprozip

RUN echo '***** Install Geist in user bin directory *****'                  \
    && wget -O ${REPROZIP_BINARY} ${REPROZIP_DOWNLOAD_URL}                  \
    && chmod u+x ${REPROZIP_BINARY}                                         \
    && ${REPROZIP_BINARY} usage_report --disable

ENV BLAZEGRAPH_VER RELEASE_2_1_5
ENV BLAZEGRAPH_RELEASES https://github.com/blazegraph/database/releases
ENV BLAZEGRAPH_DOWNLOAD_DIR ${BLAZEGRAPH_RELEASES}/download/BLAZEGRAPH_${BLAZEGRAPH_VER}
ENV BLAZEGRAPH_DOWNLOAD_JAR ${BLAZEGRAPH_DOWNLOAD_DIR}/blazegraph.jar
ENV BLAZEGRAPH_JAR $HOME/blazegraph-${BLAZEGRAPH_VER}.jar

RUN echo '***** Download Blazegraph jar *****'                              \
    && wget -O ${BLAZEGRAPH_JAR} ${BLAZEGRAPH_DOWNLOAD_JAR}

ENV BLAZEGRAPH_DOT_DIR ${REPRO_MNT}/.blazegraph
ENV BLAZEGRAPH_PROPERTY_FILE=${BLAZEGRAPH_DOT_DIR}/.properties
ENV BLAZEGRAPH_OPTIONS "-server -Xmx4g -Dbigdata.propertyFile=${BLAZEGRAPH_PROPERTY_FILE}"
ENV BLAZEGRAPH_CMD "java ${BLAZEGRAPH_OPTIONS} -jar ${BLAZEGRAPH_JAR}"
ENV BLAZEGRAPH_LOG ${BLAZEGRAPH_DOT_DIR}/blazegraph_`date +%s`.log

RUN echo '***** Start Blazegraph at login *****'                            \
    && echo "cd ${BLAZEGRAPH_DOT_DIR} && ${BLAZEGRAPH_CMD} 2>&1 > ${BLAZEGRAPH_LOG} &" >> ${BASHRC}

ENV XSB_REPO https://downloads.sourceforge.net/project/xsb
ENV XSB_VERSION 3.8%20%28Three-Buck%20Chuck%29
ENV XSB_RELEASE_DIR ${XSB_REPO}/xsb/${XSB_VERSION}
ENV XSB_INSTALLATION ${HOME}/XSB
ENV XSB_INSTALLATION_BIN ${XSB_INSTALLATION}/bin

RUN echo '***** Download and build XSB 3.8 *****'                           \
    && wget -O XSB3.8.tar.gz ${XSB_RELEASE_DIR}/XSB38.tar.gz                \
    && tar -xf XSB3.8.tar.gz                                                \
    && rm XSB3.8.tar.gz                                                     \
    && cd XSB/build                                                         \
    && ./configure                                                          \
    && ./makexsb                                                            \
    && echo "PATH=${XSB_INSTALLATION_BIN}:$PATH" >> ${BASHRC}

COPY go src

RUN echo '\n***** Build and install the rpz2cpr command *****\n'        \
    && cd ./src/cmd/rpz2cpr                                             \
    && /usr/local/go/bin/go install .


RUN echo 'PATH=~/go/bin:/usr/local/go/bin:$PATH':${RPZ_BIN_DIR} >> ${BASHRC}
RUN echo "export IN_RUNNING_REPRO=${REPRO_NAME}" >> ${BASHRC}
RUN echo "cd ${REPRO_MNT}" >> ${BASHRC}

CMD  /bin/bash -il
