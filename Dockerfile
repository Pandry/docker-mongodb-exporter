FROM alpine

RUN adduser -H -D prometheus && \
        apk add --update --no-cache curl && \
        curl -L -o mongodb_exporter.tar.gz $(curl -s https://api.github.com/repos/percona/mongodb_exporter/releases/latest | grep browser_download_url | grep linux-amd64 | cut -d '"' -f 4) && \
        apk del --no-cache curl && \
        tar -xzvf mongodb_exporter.tar.gz && \
        rm -f mongodb_exporter.tar.gz && \
        rm -rf CHANGELOG.md LICENSE README.md && \
        mv mongodb_exporter /mongo_exporter && \
        chown prometheus:prometheus /mongo_exporter && \
        chmod 555 /mongo_exporter

USER prometheus

ENTRYPOINT ["/mongo_exporter"]
