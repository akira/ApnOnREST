### Introduction

rails_apn_standalone is a standalone Rails 3 based Apple Push Notification Service that can be accessed via a REST API.  It uses a fork of the [apn_on_rails plugin](https://github.com/PRX/apn_on_rails).   I wanted to share the same APN server among a few different applications, so instead of plugging into my application, I decided to write a simple REST layer on top of apn_on_rails.  There's also a simple admin UI to manage the data.

### Installation
  
To install:

  git clone this repository
  
Then

  bundle install
  
Setup apple_push_notification_development.pem and apple_push_notification_production.pem, instructions are [here] (http://mobiforge.com/developing/story/programming-apple-push-notification-services). 

Navigate to server/apps URL and add an application.  Specify where your .pem files are on the server.

APIs include:

  /devices
  /notifications
  /apps
