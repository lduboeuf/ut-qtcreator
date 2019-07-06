FROM clickable/ubuntu-sdk:16.04-amd64

RUN apt-get update && apt-get install -y git qtcreator libxrender1 gdb

CMD ["/usr/bin/qtcreator"]
