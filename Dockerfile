# Base image
FROM rails:latest

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

ENV HOME /usr/src/app

RUN mkdir -p $HOME
WORKDIR $HOME

COPY Gemfile* $HOME/
RUN bundle install

COPY . $HOME/

RUN apt-get update && apt-get install -y nodejs --no-install-recommends && rm -rf /var/lib/apt/lists/*
RUN apt-get update && apt-get install -y mysql-client --no-install-recommends && rm -rf /var/lib/apt/lists/*

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0", "-e", "production"]
