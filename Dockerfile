FROM ruby:3.1.2-alpine

RUN apk add alpine-sdk nodejs npm

WORKDIR /bundler
COPY Gemfile.lock Gemfile .
RUN bundle install

WORKDIR /app
COPY . .
RUN npm i

CMD bundle exec jekyll serve --incremental
