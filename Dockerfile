# Base image
FROM rails:latest

ENV HOME /home/rails/webapp

# Install PGsql dependencies and js engine
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

WORKDIR $HOME

# Install gems
COPY Gemfile* $HOME/
RUN bundle install

# Add the app code
COPY . $HOME

EXPOSE 3000
# Default command
CMD ["rails", "server", "-b", "0.0.0.0", "-e", "production"]
