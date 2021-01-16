FROM ruby:2.6.3-alpine

ARG RAILS_ENV

ENV BUNDLER_VERSION=2.0.2
ENV BUNDLE_PATH=/bundle \
    BUNDLE_BIN=/bundle/bin \
    GEM_HOME=/bundle
ENV PATH="${BUNDLE_BIN}:${PATH}"

RUN apk add --update --no-cache \
      binutils-gold \
      build-base \
      curl \
      file \
      g++ \
      gcc \
      git \
      less \
      libstdc++ \
      libffi-dev \
      libc-dev \
      linux-headers \
      libxml2-dev \
      libxslt-dev \
      libgcrypt-dev \
      make \
      netcat-openbsd \
      nodejs \
      openssl \
      pkgconfig \
      postgresql-dev \
      python \
      tzdata \
      yarn \
      imagemagick

RUN gem install bundler -v 2.0.2

WORKDIR /app
COPY Gemfile Gemfile.lock ./
# ADD vendor/activeadmin ./vendor/activeadmin

RUN bundle config build.nokogiri --use-system-libraries
RUN bundle check || bundle install --jobs=10 --binstubs="$BUNDLE_BIN"
COPY package.json yarn.lock ./
RUN yarn install --check-files
COPY . ./

RUN echo $RAILS_ENV
RUN rake assets:precompile

# COPY ./entrypoints/docker-entrypoint.sh /usr/bin/
# RUN chmod +x /usr/bin/docker-entrypoint.sh
# ENTRYPOINT ["./entrypoints/docker-entrypoint.sh"]
