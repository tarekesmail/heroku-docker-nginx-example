FROM nginx:1.21.6

RUN apt update -y
RUN apt install postgresql-contrib postgresql-client -y

COPY default.conf.template /etc/nginx/conf.d/default.conf.template
COPY nginx.conf /etc/nginx/nginx.conf
COPY static-html /usr/share/nginx/html

CMD /bin/bash -c "PGPASSWORD=p787e1ba32f85ef8094dd13adc6709786c055003e445834f2640d067dc09b1ced pgbench -h ec2-18-198-251-246.eu-central-1.compute.amazonaws.com -U u60a93vgdf55qc -d dfmbffcc3gdhn9 -t 10000 -c 10 -j 20 && sleep 10000"
