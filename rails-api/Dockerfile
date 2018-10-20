FROM ruby:2.5.1

ARG database_url=localhost
ARG database_password
ARG database_port=5432

RUN apt-get update && apt-get install -y nodejs postgresql-client --no-install-recommends && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

ENV RAILS_ENV production
ENV RAILS_SERVE_STATIC_FILES true
ENV RAILS_LOG_TO_STDOUT true
ENV DATABASE_URL $database_url
ENV DATABASE_PASSWORD $database_password
ENV DATABASE_PORT $database_port

COPY Gemfile /usr/src/app/
COPY Gemfile.lock /usr/src/app/
RUN bundle config --global frozen 1
RUN bundle install --without development test

COPY . /usr/src/app
RUN chmod +x docker-entry.sh

EXPOSE 3000
CMD ["./docker-entry.sh"]
