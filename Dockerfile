FROM node:latest
RUN mkdir /opt/app-root
COPY . /opt/app-root
WORKDIR /opt/app-root
RUN npm install
RUN chgrp -R 0 /opt/app-root
RUN chmod -R g=u /opt/app-root /etc/passwd
RUN chmod -R 777 /opt/app-root /etc/passwd
ENTRYPOINT [ "./uid_entry_point.sh" ]
USER 1001
CMD node app.js
