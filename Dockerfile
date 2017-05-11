FROM minio/minio:latest

RUN \
  apk update && apk add --no-cache bind-tools jq bash curl && \
  curl -o /usr/bin/docker-entrypoint.sh https://gist.githubusercontent.com/hackintoshrao/7b33ac850c20bdfbc1c1e2e0caf2f664/raw/fcd1d15771d76b08cf469fcd7e1197766a544f28/docker-entrypoint.sh && \
  curl -o /go/src/github.com/minio/minio-dcos-wrapper.sh https://gist.githubusercontent.com/hackintoshrao/930758f06956da8c0e65f325fe62b400/raw/45bea75482a72a2ea17822fdce14a641992d60e1/minio-dcos-wrapper.sh

RUN chmod +x /usr/bin/docker-entrypoint.sh
RUN chmod +x /go/src/github.com/minio/minio-dcos-wrapper.sh


ENTRYPOINT ["/usr/bin/docker-entrypoint.sh"]

