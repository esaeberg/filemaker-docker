FROM centos:7

COPY LicenseCert.fmcert /root/LicenseCert.fmcert
COPY ["Assisted Install.txt", "/Assisted Install.txt"]
COPY start.sh /

RUN yum -y update && \
yum install -y centos-release-scl && \
yum install -y wget && \
yum install -y sudo && \
yum install -y unzip && \
yum clean all && \
wget -P /root/ "PUT_HERE_YOUR_PERSONNAL_URL" && \
cd 'root' && \
unzip *.zip -d /root/ && \
rm *.zip && \
cd .. && \
rm '/root/Assisted Install.txt' && \
rm '/root/README_Installation_English.txt' && \
rm '/root/README_Installation_French.txt' && \
rm '/root/README_Installation_German.txt' && \
rm '/root/README_Installation_Italian.txt' && \
rm '/root/README_Installation_Japanese.txt' && \
rm '/root/README_Installation_Spanish.txt' && \
rm '/root/FMS License (English).rtf' && \
rm '/root/FMS License (French).rtf' && \
rm '/root/FMS License (German).rtf' && \
rm '/root/FMS License (Italian).rtf' && \
rm '/root/FMS License (Japanese).rtf' && \
rm '/root/FMS License (Spanish).rtf' && \
FM_ASSISTED_INSTALL='/Assisted Install.txt' yum install *.rpm -y && \
rm '/Assisted Install.txt' && \
cd 'root' && \
rm '*.rpm' && \
yum clean all && \
chmod +x /start.sh

EXPOSE 80/tcp
EXPOSE 443/tcp
EXPOSE 2399/tcp
EXPOSE 5003/tcp
EXPOSE 16000/tcp
EXPOSE 16001/tcp
EXPOSE 16002/tcp

CMD ["/start.sh"]
