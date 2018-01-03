# Base image
FROM rails:latest

ENV HOME /home/rails/webapp

# Install PGsql dependencies and js engine
RUN apt-get update && apt-get install -y nodejs --no-install-recommends && rm -rf /var/lib/apt/lists/*
RUN apt-get update && apt-get install -y mysql-client --no-install-recommends && rm -rf /var/lib/apt/lists/*

WORKDIR $HOME

# Install gems
COPY Gemfile* $HOME/
RUN bundle install

# Add the app code
COPY . $HOME

EXPOSE 3000
# Default command
CMD ["rails", "server", "-b", "0.0.0.0", "-e", "production"]
