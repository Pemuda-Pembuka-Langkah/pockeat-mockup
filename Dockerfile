FROM debian:latest

# Install Flutter dependencies
RUN apt-get update && \
    apt-get install -y curl git wget unzip libgconf-2-4 gdb libstdc++6 libglu1-mesa fonts-droid-fallback lib32stdc++6 python3

# Install Flutter
RUN git clone https://github.com/flutter/flutter.git /usr/local/flutter
ENV PATH="/usr/local/flutter/bin:/usr/local/flutter/bin/cache/dart-sdk/bin:${PATH}"

# Basic Flutter setup
RUN flutter doctor -v
RUN flutter channel stable
RUN flutter upgrade

# Build web
WORKDIR /app
COPY . .
RUN flutter pub get
RUN flutter build web

# Serve folder
WORKDIR /app/build/web
CMD python3 -m http.server 8080