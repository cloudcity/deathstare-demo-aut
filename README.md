# DEATHSTARE-DEMO-AUT
=====================

This is a simple application that exists only so that you can see a working example of a test application
running the Deathstare Rails engine. The AUT suffix is the generally accepted acronym for Application Under Test.

This application is one half of a set of two applications that demonstrate how you would performance test your own
JSON API application. The other half is DEATHSTARE-DEMO-TEST which makes API calls to this application to load test it.

## Quickstart

You will need two applications on your development machine to run this demonstration.

Clone deathstare-demo-aut onto your development machine.

Now go to github/cloudcity/deathstare-demo-test and follow the instructions under that repo's README.

## More detail

The Application under test is called deathstare-demo-aut. It is a minimalistic application in that it simulates an API
that allows the caller to create users, login a user, create a client_device, and manage a set of widgets by creating a
widget, listing all existing widgets, and deleting a widget.

Because we are only attempting to demonstrate how to write a testing application, the user, login, and client_device
endpoints do not really perform those functions but return a good status as though they have done some real work.
The widget endpoints, however, do perform real work.

users#create - dummy
login#create
client_devices#create
widget#create
widget#index
widget#delete