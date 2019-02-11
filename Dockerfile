FROM rocker/verse:3.5.2

RUN install2.r svglite

RUN installGithub.r \
  maxheld83/qmethod@d85ad649f09a591b9468b8b236d26e8ec6f66cda
