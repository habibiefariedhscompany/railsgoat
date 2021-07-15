FROM ruby:2.6.5
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs netcat

RUN mkdir /myapp
WORKDIR /myapp
ADD . /myapp

RUN gem install bundler -v 1.17.3
RUN bundle install
RUN chmod +x /myapp/initcommand.sh

ENTRYPOINT ["/bin/bash"]
CMD ["-c", "/myapp/initcommand.sh"]