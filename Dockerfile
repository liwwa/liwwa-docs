FROM ruby:2.6-slim AS build

WORKDIR /srv/slate

EXPOSE 4567

COPY Gemfile .
COPY Gemfile.lock .

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        build-essential \
        git \
        nodejs \
    && gem install bundler -v 2.4.22\
    && bundle install \
    && apt-get remove -y build-essential git \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/*

COPY . /srv/slate

RUN chmod +x /srv/slate/slate.sh

RUN ["/srv/slate/slate.sh", "build"]

FROM nginx:latest

EXPOSE 80

COPY --from=build /srv/slate/build /usr/share/nginx/html
