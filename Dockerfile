FROM gitpod/workspace-full:latest

USER root

RUN apt-get update

WORKDIR /myapp

USER gitpod

WORKDIR /myapp
ENV PATH /usr/local/rvm/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
RUN /bin/bash -l -c "rvm requirements"
RUN /bin/bash -l -c "rvm install 2.6.5"
RUN /bin/bash -l -c "echo 'very-best-debug '"
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN /bin/bash -l -c "rvm use --default 2.6.5 && gem install bundler"

RUN /bin/bash -l -c "bundle install"
