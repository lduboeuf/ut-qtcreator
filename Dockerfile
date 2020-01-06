FROM clickable/ubuntu-sdk:16.04-amd64

RUN apt-get update && apt-get install -y \
	git \
	qtcreator \
	libxrender1 \
	gdb \
	qml-module-qtcontacts \
	qtdeclarative5-ubuntu-contacts0.1 \
	qtdeclarative5-qtcontacts-plugin \
	qml-module-ofono \
	qtdeclarative5-gsettings1.0 \
	qtdeclarative5-ubuntu-telephony-phonenumber0.1 \
	qtdeclarative5-ubuntu-history0.1 \
	qtdeclarative5-ubuntu-telephony0.1 \
	qml-module-qtquick-dialogs \
	qml-module-qtquick-extras

##install plugins
RUN qmlplugindump -nonrelocatable Ubuntu.Contacts 0.1 /usr/lib/x86_64-linux-gnu/qt5/qml > /usr/lib/x86_64-linux-gnu/qt5/qml/Ubuntu/Contacts.0.1/plugins.qmltypes
RUN qmlplugindump -nonrelocatable Ubuntu.History 0.1 /usr/lib/x86_64-linux-gnu/qt5/qml > /usr/lib/x86_64-linux-gnu/qt5/qml/Ubuntu/History/plugins.qmltypes
RUN qmlplugindump -nonrelocatable Ubuntu.Telephony 0.1 /usr/lib/x86_64-linux-gnu/qt5/qml > /usr/lib/x86_64-linux-gnu/qt5/qml/Ubuntu/Telephony/plugins.qmltypes
RUN qmlplugindump -nonrelocatable Morph.Web 0.1 /usr/lib/x86_64-linux-gnu/qt5/qml > /usr/lib/x86_64-linux-gnu/qt5/qml/Morph/Web/plugins.qmltypes

CMD ["/usr/bin/qtcreator"]
