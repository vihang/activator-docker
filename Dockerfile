FROM openjdk:8

MAINTAINER Vihang Patel <vihang@finaxar.com>

ENV ACTIVATOR_VERSION 1.3.12

RUN apt-get update
RUN apt-get install -y unzip

# Download and install Activator
RUN wget --output-document /opt/activator-$ACTIVATOR_VERSION.zip http://downloads.typesafe.com/typesafe-activator/$ACTIVATOR_VERSION/typesafe-activator-$ACTIVATOR_VERSION.zip
RUN unzip /opt/activator-$ACTIVATOR_VERSION.zip -d /opt
RUN rm -f /opt/activator-$ACTIVATOR_VERSION.zip
RUN mv /opt/activator-dist-$ACTIVATOR_VERSION /opt/activator
  
# Create a working directory to run your app from
RUN mkdir /home/app
WORKDIR /home/app

# Expose port 9000 for the app under /home/app
EXPOSE 9000
 
# Default Entry Point
ENTRYPOINT ["/opt/activator/activator", "-Dhttp.address=0.0.0.0"]

# Default Command
CMD ["ui"]
