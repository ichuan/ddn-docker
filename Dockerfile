FROM node:8.17.0-stretch
WORKDIR /opt/coin
RUN apt update && apt install -y sqlite3
RUN wget http://releases.ddn.link/2.0.4/ddn-linux-2.0.4-mainnet.tar.gz -O - | tar --strip-components 1 -xzf -
COPY ./entrypoint.sh /opt/
RUN chmod +x /opt/entrypoint.sh
# cleanup
RUN apt autoremove -y && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/opt/entrypoint.sh"]
