# FROM jenkins/jenkins:2.346.1

# LABEL maintainer="amalcdac521@gmail.com"
# COPY plugin.txt /usr/share/jenkins/ref/plugins.txt

# ENV JENKINS_HOME /var/jenkins_home

# ARG JAVA_OPTS
# ENV JAVA_OPTS "-Djenkins.install.runSetupWizard=false ${JAVA_OPTS:-}"
# ENV CURL_OPTIONS=-sSfkL

# RUN  /usr/local/bin/install-plugins.sh  < /usr/share/jenkins/ref/plugins.txt 



# FROM jenkins/jenkins:2.346.1

# LABEL maintainer="amalcdac521@gmail.com"
# COPY plugins.txt /usr/share/jenkins/ref/plugins.txt

# ENV JENKINS_HOME /var/jenkins_home

# ARG JAVA_OPTS
# ENV JAVA_OPTS "-Djenkins.install.runSetupWizard=false ${JAVA_OPTS:-}"
# ENV CURL_OPTIONS=-sSfkL

# RUN /usr/local/bin/install-plugins.sh $(cat /usr/share/jenkins/ref/plugins.txt | tr '\n' ' ')


FROM jenkins/jenkins:2.397

LABEL maintainer="amalcdac521@gmail.com"
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt

ENV JENKINS_HOME /var/jenkins_home

# ARG JAVA_OPTS
# ENV JAVA_OPTS "-Djenkins.install.runSetupWizard=false ${JAVA_OPTS:-}"
# ENV CURL_OPTIONS=-sSfkL

# RUN jenkins-plugin-cli --plugin-file /usr/share/jenkins/ref/plugins.txt
