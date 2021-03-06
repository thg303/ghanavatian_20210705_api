FROM ruby:2.7.2-slim
MAINTAINER Ali Ghanavatian "ghanavatian.ali@gmail.com"

ENV LANG C.UTF-8
RUN apt-get update -qq && apt-get install -y build-essential curl libpq-dev git postgresql-client \
   mime-support ruby-mini-magick ffmpegthumbnailer

EXPOSE 3000

# Define where our application will live inside the image
ENV RAILS_ROOT /var/www/casvid
ENV RAILS_ENV production

# Site domain
ARG SEC_KEY='change0me0in0docker0compose'
ENV SECRET_KEY_BASE=${SEC_KEY}

# Create application home. App server will need the pids dir so just create everything in one shot
RUN mkdir -p $RAILS_ROOT/tmp/pids

# Set our working directory inside the image
WORKDIR $RAILS_ROOT

RUN gem install puma -v '5.0'

# Use the Gemfiles as Docker cache markers. Always bundle before copying app src.
# (the src likely changed and we don't want to invalidate Docker's cache too early)
# http://ilikestuffblog.com/2014/01/06/how-to-skip-bundle-install-when-deploying-a-rails-app-to-docker/
COPY Gemfile Gemfile

COPY Gemfile.lock Gemfile.lock

# Prevents bug in build process
RUN gem update --system

# Prevent bundler warnings; ensure that the bundler version executed is >= that which created Gemfile.lock
RUN gem install bundler -v 2.1.4

# Finish establishing our Ruby enviornment
RUN bundle install --binstubs

RUN bundle

# Copy the Rails application into place
COPY . .

VOLUME [ '/var/www/casvid/public/uploads' ]

# Define the script we want run once the container boots
# Use the "exec" form of CMD so our script shuts down gracefully on SIGTERM (i.e. `docker stop`)
#CMD [ "config/containers/app_cmd.sh" ]
CMD [ "sh", "startup.sh"]