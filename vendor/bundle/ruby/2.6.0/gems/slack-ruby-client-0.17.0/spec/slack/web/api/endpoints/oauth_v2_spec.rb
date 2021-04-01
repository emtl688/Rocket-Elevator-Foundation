# frozen_string_literal: true
# This file was auto-generated by lib/tasks/web.rake

require 'spec_helper'

RSpec.describe Slack::Web::Api::Endpoints::OauthV2 do
  let(:client) { Slack::Web::Client.new }
  context 'oauth.v2_access' do
    it 'requires code' do
      expect { client.oauth_v2_access }.to raise_error ArgumentError, /Required arguments :code missing/
    end
  end
end
