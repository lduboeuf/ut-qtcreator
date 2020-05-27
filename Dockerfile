FROM clickable/ubuntu-sdk:16.04-amd64

RUN apt-get update && apt-get install -y \
	qtcreator

#qml modules
RUN apt-get update && apt-get install -y \
	qml-module-qtcontacts \
	qtdeclarative5-ubuntu-contacts0.1 \
	qtdeclarative5-qtcontacts-plugin \
	qtdeclarative5-ubuntu-addressbook0.1 \
	qtdeclarative5-gsettings1.0 \
	qtdeclarative5-ubuntu-telephony-phonenumber0.1 \
	qtdeclarative5-ubuntu-history0.1 \
	qtdeclarative5-ubuntu-telephony0.1 \
	qtdeclarative5-ubuntu-keyboard-extensions0.1 \
	qml-module-qt-labs-folderlistmodel \
	qml-module-qt-labs-platform \
	qml-module-qt-labs-settings \
	qml-module-ofono \
	qml-module-morph-web \
	qml-module-qtquick-dialogs \
	qml-module-qtquick-extras

#dev libs
RUN apt-get update && apt-get install -y \
	libofono-qt-dev \
	libqofono-dev \
	telepathy-mission-control-5 \
	libmission-control-plugins0 \
	libphonenumber-dev \
	libsqlite3-dev \
	libtelepathy-qt5-dev \
	libglib2.0-dev \
 	libqt5gstreamer-dev \
	dconf-service \
	libmission-control-plugins-dev \
	libandroid-properties-dev \
	libandroid-properties1 \
	qtwebengine5-dev

##install plugins
COPY plugins.csv /tmp/plugins.csv
COPY register_plugins.sh /tmp/register_plugins.sh
RUN cd /tmp && chmod +x register_plugins.sh && ./register_plugins.sh

CMD ["/usr/bin/qtcreator"]
