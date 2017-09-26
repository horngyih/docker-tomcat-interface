FROM tomcat:7

RUN apt-get update
RUN apt-get install libxrender1 xfonts-base xfonts-75dpi fontconfig xvfb -y
RUN wget https://bitbucket.org/wkhtmltopdf/wkhtmltopdf/downloads/wkhtmltox-0.13.0-alpha-7b36694_linux-jessie-amd64.deb
RUN dpkg -i wkhtmltox-0.13.0-alpha-7b36694_linux-jessie-amd64.deb
RUN echo 'xvfb-run --server-args="-screen 0, 1024x768x24" /usr/local/bin/wkhtmltopdf $*' > /usr/bin/wkhtmltopdf.sh
RUN chmod a+rx /usr/bin/wkhtmltopdf.sh
RUN ln -s /usr/bin/wkhtmltopdf.sh /usr/local/sbin/wkhtmltopdf
RUN rm wkhtmltox-0.13.0-alpha-7b36694_linux-jessie-amd64.deb
