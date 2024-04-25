FROM ruby:3.0.3

RUN apt-get update \
    && apt-get install -y \
       build-essential \
       libpq-dev \
       nodejs \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir /app

WORKDIR /app

COPY Gemfile Gemfile.lock /app/


RUN bundle install --full-index



COPY . /app





