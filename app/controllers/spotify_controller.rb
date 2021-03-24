require 'rspotify'
class Spotify < ApplicationRecord
    RSpotify.authenticate(ENV['SPOTIFY_KEY'], ENV['SPOTIFY_SECRET_KEY'])
end