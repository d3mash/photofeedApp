FROM ruby:2.6.1

RUN mkdir /app

WORKDIR /app

ADD Gemfile /app
ADD Gemfile.lock /app

RUN \
  mkdir -p /var/bundle && \
  bundle install

ADD . /app

CMD ["bundle", "exec", "rails", "server"]