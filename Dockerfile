FROM ruby:2.4.5

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev node.js

RUN mkdir /family_stories
WORKDIR /family_stories

COPY Gemfile /family_stories/Gemfile
COPY Gemfile.lock /family_stories/Gemfile.lock

RUN gem install bundler --version "2.0.1"
RUN bundle install

COPY . /family_stories
