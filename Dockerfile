FROM node:6.10.0

MAINTAINER José Antonio López <kstro10@gmail.com>

RUN useradd --user-group --create-home --shell /bin/false app

ENV HOME=/home/app
WORKDIR $HOME

RUN npm install -g @angular/cli && npm cache clean

# 4200 = Webpack port
# 49153 = Live reload port
EXPOSE 4200 49153

ENTRYPOINT ["/bin/bash", "-c"]
