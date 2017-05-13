FROM ruby:2.4.1
RUN echo deb http://apt.postgresql.org/pub/repos/apt/ jessie-pgdg main 9.5 > /etc/apt/sources.list.d/postgresql.list
RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs vim postgresql-client-9.5

ENV APP_HOME /prompt

RUN mkdir $APP_HOME
WORKDIR $APP_HOME

ADD Gemfile $APP_HOME/Gemfile
ADD Gemfile.lock $APP_HOME/Gemfile.lock

RUN gem install bundler --conservative
RUN bundle check || bundle install
ADD . $APP_HOME
