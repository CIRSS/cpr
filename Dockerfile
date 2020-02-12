FROM debian:10.2

RUN echo '***** Update packages *****'                                      \
    && apt-get -y update                                                    \
                                                                            \
    && echo '***** Install packages REQUIRED for creating this image *****' \
    && apt-get -y install apt-utils wget curl makepasswd gcc make           \
                                                                            \
    && echo '***** Install packages required by YesWorkflow *****'          \
    && apt -y install default-jdk                                           \
    && apt -y install graphviz                                              \
                                                                            \
    && echo '***** Install command-line utility packages *****'             \
    && apt-get -y install sudo man less file tree

RUN echo '***** Create the yw user *****'                       \
    && useradd yw --gid sudo                                    \
                  --shell /bin/bash                             \
                  --create-home                                 \
    && echo "yw ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/yw    \
    && chmod 0440 /etc/sudoers.d/yw

ENV HOME /home/yw
USER  yw
WORKDIR $HOME

ENV YW_VERSION 0.2.1.2
ENV YW_RELEASES https://github.com/yesworkflow-org/yw-prototypes/releases
ENV YW_RELEASE_DIR ${YW_RELEASES}/download/v${YW_VERSION}/
ENV YW_RELEASE_JAR yesworkflow-${YW_VERSION}-jar-with-dependencies.jar
ENV YW_JAR $HOME/bin/yesworkflow-${YW_VERSION}.jar

RUN echo '***** Download yw-prototypes executable jar and create alias *****'   \
    && mkdir $HOME/bin                                                          \
    && wget -O $YW_JAR ${YW_RELEASE_DIR}/${YW_RELEASE_JAR}                      \
    && echo "alias yw='java -jar $YW_JAR'"  >> $HOME/.bash_aliases


ENV XSB_VERSION 3.8%20%28Three-Buck%20Chuck%29
ENV XSB_RELEASE_DIR https://downloads.sourceforge.net/project/xsb/xsb/${XSB_VERSION}

RUN echo '***** Download and build XSB 3.8 *****'               \
    && wget -O XSB3.8.tar.gz ${XSB_RELEASE_DIR}/XSB38.tar.gz    \
    && tar -xf XSB3.8.tar.gz                                    \
    && cd XSB/build                                             \
    && ./configure                                              \
    && ./makexsb


RUN echo 'PATH=/home/yw/XSB/bin:$PATH' >> .bashrc

CMD  /bin/bash -il
