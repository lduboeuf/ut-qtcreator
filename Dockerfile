FROM clickable/ubuntu-sdk:16.04-amd64

RUN apt-get update && apt-get install -y \
	qtcreator


RUN apt-get update && apt-get install -y \
	qml-module-qtcontacts \
	qtdeclarative5-ubuntu-contacts0.1 \
	qtdeclarative5-qtcontacts-plugin \
	qml-module-ofono \
	qtdeclarative5-gsettings1.0 \
	qtdeclarative5-ubuntu-telephony-phonenumber0.1 \
	qtdeclarative5-ubuntu-history0.1 \
	qtdeclarative5-ubuntu-telephony0.1 \
	qml-module-qt-labs-folderlistmodel \
	qml-module-qt-labs-platform \
	qml-module-qt-labs-settings \
	qml-module-morph-web \
	qtwebengine5-dev


##install plugins
COPY plugins.csv /tmp/plugins.csv
COPY register_plugins.sh /tmp/register_plugins.sh
RUN cd /tmp && chmod +x register_plugins.sh && ./register_plugins.sh
#RUN chmod +x /tmp/register_plugins.sh 
#RUN /tmp/register_plugins.sh
#ARG QML_LIB_PATH=/usr/lib/x86_64-linux-gnu/qt5/qml
#ARG QML_TYPE_NAME=plugins.qmltypes
#RUN qmlplugindump -nonrelocatable Ubuntu.Contacts 0.1 ${QML_LIB_PATH} > ${QML_LIB_PATH}/Ubuntu/Contacts.0.1/plugins.qmltypes
#RUN qmlplugindump -nonrelocatable Ubuntu.History 0.1 ${QML_LIB_PATH} > ${QML_LIB_PATH}/Ubuntu/History/plugins.qmltypes
#RUN qmlplugindump -nonrelocatable Ubuntu.Telephony 0.1 ${QML_LIB_PATH} > ${QML_LIB_PATH}/Ubuntu/Telephony/plugins.qmltypes
#RUN qmlplugindump -nonrelocatable  -noinstantiate -dependencies "/tmp/empty.json" Morph.Web 0.1 ${QML_LIB_PATH}> ${QML_LIB_PATH}/Morph/Web/plugins.qmltypes

CMD ["/usr/bin/qtcreator"]
