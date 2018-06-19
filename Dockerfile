FROM ruby:2.4-alpine
# too edgy/non-deterministic
# FROM ruby:latest

# Set environment.
ENV \
  DEBIAN_FRONTEND=noninteractive \
  TERM=xterm-color

RUN mkdir -p /app
WORKDIR /app

RUN set -xe \
 && apk --update --no-cache add \
    alpine-sdk \
    nodejs \
 && gem install \
    middleman \
    middleman-blog \
    middleman-targets \
    middleman-livereload \
    middleman-asciidoc \
    middleman-sprockets \
    execjs \
    therubyracer \
    nokogiri \
    redcarpet \
    builder \
    i18n

# Expose ports.
EXPOSE 4567 35729
ENTRYPOINT ["bundle", "exec", "middleman"]
CMD ["server"]
