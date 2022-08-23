FROM maven:3.8.6-openjdk-11
RUN apt update
RUN apt install -y git
RUN rm -rf /tmp/build/app /tmp/build/tmct && mkdir -p /tmp/build/app /tmp/build/tmct
RUN git clone https://github.com/shephertz/App42PaaS-Java-MySQL-Sample.git /tmp/build/app
COPY ./Config.properties /tmp/build/app/WebContent/
WORKDIR /tmp/build/
RUN mvn package -f app/
RUN cp app/target/*.war ./tmct
RUN cp app/WebContent/Config.properties ./tmct