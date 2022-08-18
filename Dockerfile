FROM ruby:3.0.2

RUN apt-get update -qq && apt-get install -y nodejs yarn

ENV RAILS_ROOT=/app
ENV REDIS_URL=redis://redis:6379/1

WORKDIR $RAILS_ROOT

COPY Gemfile Gemfile.lock ./

RUN apt-get update && apt-get install -y git curl libmcrypt-dev default-mysql-client 
RUN gem install bundler rails
RUN bundle install
RUN rails -v

COPY . ./

EXPOSE 3000

# ENTRYPOINT [ "sh",$RAILS_ROOT/entrypoint.sh]

CMD ["rails", "server", "-p", "3000", "-b", "0.0.0.0"]