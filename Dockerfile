# docker build -t hughsw/nodejs .
# docker run -it -p 2222:22 hughsw/nodejs
# docker push hughsw/nodejs

FROM hughsw/ubuntu

# Get nodejs repositories
RUN curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -

# Install nodejs, upgrade npm, install angular-cli
# (all in one RUN as per workaround to issue we encountered: https://github.com/npm/npm/issues/9863)
RUN apt-get install -y nodejs \
  && npm set -g color false && npm set -g spin false \
  && npm update -g npm \
  && npm install -g angular-cli \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
  && echo Yes!

#&& npm set -g progress false \


