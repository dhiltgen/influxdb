FROM scratch

EXPOSE 8088 8083 8086 25826 4242
CMD ["/bin/influxd", "-config", "/etc/influxdb.conf"]

ADD influxdb.conf /etc/influxdb.conf
ADD ./bin/ /bin/
