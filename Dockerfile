FROM ruby:2.5
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /about_company
WORKDIR /about_company
ADD Gemfile /about_company/Gemfile
ADD Gemfile.lock /about_company/Gemfile.lock
RUN bundle install
ADD . about_company
RUN bundle install

