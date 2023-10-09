FROM ubuntu:20.04

# Set the DEBIAN_FRONTEND environment variable to noninteractive
ENV DEBIAN_FRONTEND noninteractive

# Install dependencies for Android SDK, QEMU, Python 3.10, pip3, Node.js, and npm
RUN apt-get update && apt-get install -y \
    psmisc \
    wget \
    openjdk-8-jdk \
    unzip \
    cpu-checker \
    qemu-kvm \
    libvirt-clients \
    libvirt-daemon-system \
    bridge-utils \
    python3.10 \
    python3-pip \
    python3-testresources \
    nodejs \
    npm \
    software-properties-common \
    xclip

RUN add-apt-repository ppa:alex-p/tesseract-ocr-devel && apt update && apt install -y tesseract-ocr && apt update

# Install and update Node.js and npm, Install n package, Install the latest version of Node.js
RUN npm install -g n && \
    n latest

# Download and install Android SDK
RUN wget https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip && \
    unzip sdk-tools-linux-4333796.zip -d /opt/android-sdk && \
    rm -v sdk-tools-linux-4333796.zip

ENV ANDROID_HOME /opt/android-sdk
ENV PATH "${ANDROID_HOME}/tools:${ANDROID_HOME}/tools/bin:${ANDROID_HOME}/platform-tools:${PATH}"

# Update sdkmanager, accept licenses, and install required packages
RUN sdkmanager --update && \
    yes | sdkmanager --licenses && \
    sdkmanager "platform-tools" "platforms;android-30" "build-tools;33.0.1" && \
    sdkmanager "system-images;android-30;google_apis;x86_64"

# Set ANDROID_AVD_HOME PATH
ENV ANDROID_AVD_HOME /root/.android/avd

# Create Android Virtual Device (AVD)
RUN avdmanager create avd --force --name EMU --package "system-images;android-30;google_apis;x86_64" --abi "x86_64" --device "Nexus 5"

# Install the Robot Framework, Appium Library, and test suite dependencies
RUN pip3 install robotframework \
                robotframework-appiumlibrary \
                robotframework-jsonlibrary \
                robotframework-requests \
                clipboard \
                google-api-python-client \
                google-auth \
                google-auth-httplib2 \
                google-auth-oauthlib \
                opencv-python \
                QrScan \
                requests --upgrade \
                pytz \
                opencv-python \
                pytesseract \
                pillow \
                jsondiff \
                pyperclip

# Install Appium, appium-doctor, and uiautomator2 driver
RUN npm install -g appium@latest \
                wd \
                appium-doctor

# Create a directory for Robot Framework test files
RUN mkdir RF

# Copy QA-test files to 'RF' folder
COPY QA-tests /RF

# Copy and unzip the <ZipFileName>.zip file
# TOCHECK: copy an actual zipped apk into the QA folder in the repository,
#		then replace the <ZipFileName> parts and use(uncomment) the lines below.
#		After that check out for more TODO in the run.sh file
COPY QA-tests/AutomationDemo/resources/app/ApiDemos-debug.apk /opt/android-sdk/platform-tools
#RUN unzip <ZipFileName>.zip -d /opt/android-sdk/platform-tools && rm -v /<ZipFileName>.zip
