FROM ubuntu:latest

RUN apt-get update -y && \
    apt-get install -y dos2unix software-properties-common curl && \
    add-apt-repository ppa:webupd8team/java -y && \
    apt-get update -y && \
    echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections && \
    apt-get install -y --no-install-recommends oracle-java8-installer zip unzip nodejs npm && \
    npm -g install phonegap && \
    wget https://services.gradle.org/distributions/gradle-5.0-bin.zip -P /tmp && \
    mkdir -p /opt/gradle && unzip -d /opt/gradle /tmp/gradle-*.zip && \
    curl -L https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip -o /tmp/sdk.zip && \
    mkdir -p /opt/android/sdk && unzip -d /opt/android/sdk /tmp/sdk.zip && \
    yes | /opt/android/sdk/tools/bin/sdkmanager --licenses && \
    /opt/android/sdk/tools/bin/sdkmanager --install "platform-tools" "build-tools;19.1.0" && \
    apt-get remove -y software-properties-common curl unzip && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean && \
    rm -rf /tmp/*

ENV GRADLE_HOME /opt/gradle/gradle-5.0
ENV ANDROID_HOME /opt/android/sdk
ENV PATH "${GRADLE_HOME}/bin:${ANDROID_HOME}/tools/bin:${ANDROID_HOME}/platform-tools:${PATH}"
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle