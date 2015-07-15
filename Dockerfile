FROM       golang
MAINTAINER Love Nyberg <love.nyberg@lovemusic.se> (@jacksoncage)
EXPOSE     8000-8100

ENV APPPATH $GOPATH/src/github.com/jacksoncage/munin_exporter
COPY . $APPPATH
COPY start /bin/start
RUN cd $APPPATH && go get -d && go build -o /bin/munin_exporter \
    && mv $APPPATH/start /bin/start && rm -rf $GOPATH
WORKDIR /bin

CMD ["bash", "/bin/start"]
