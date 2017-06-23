#!/bin/sh

echo Cloning the repository.
echo
git clone https://github.com/texpert/flight_search.git

cd flight_search

echo Installing server bundle.
echo
bundle install

echo Starting the server.
echo
puma -C config/puma.rb
