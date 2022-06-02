FROM cm2network/steamcmd:latest

USER root

# Update and install
RUN apt update -y \
    && apt install -y wine gettext-base xvfb \
    && apt-get install -y x11-utils \
    && dpkg --add-architecture i386 \
    && apt-get update && apt-get install -y wine32

# Make directory and own it
RUN mkdir /saves \
    && chown steam /saves

RUN winecfg

COPY run.sh /

RUN chmod +x run.sh

USER steam

RUN ./steamcmd.sh +@sSteamCmdForcePlatformType windows +login anonymous +app_update 1829350 validate +quit

EXPOSE 9876/udp
EXPOSE 9877/udp

ENTRYPOINT [ "run.sh" ]
