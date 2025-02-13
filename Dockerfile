FROM debian:latest

# Install Flutter dependencies
RUN apt-get update && \
    apt-get install -y \
    curl \
    git \
    wget \
    unzip \
    libgconf-2-4 \
    gdb \
    libstdc++6 \
    libglu1-mesa \
    fonts-droid-fallback \
    lib32stdc++6 \
    python3 \
    xz-utils

# Install Flutter
RUN git clone https://github.com/flutter/flutter.git /usr/local/flutter
ENV PATH="/usr/local/flutter/bin:/usr/local/flutter/bin/cache/dart-sdk/bin:${PATH}"

# Clean and configure Flutter
RUN flutter doctor -v
RUN flutter channel stable
RUN flutter upgrade
RUN flutter config --enable-web

# Set working directory
WORKDIR /app

# Copy pubspec files first
COPY pubspec.* ./

# Get dependencies
RUN flutter pub get

# Copy the rest of the application
COPY . .

# Clean before building
RUN flutter clean
RUN flutter pub get

# Build web with specific configurations
RUN flutter build web

# Serve folder
WORKDIR /app/build/web
CMD ["python3", "-m", "http.server", "8080"]