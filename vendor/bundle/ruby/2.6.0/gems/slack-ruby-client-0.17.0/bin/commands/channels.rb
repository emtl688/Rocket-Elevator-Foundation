# frozen_string_literal: true
# This file was auto-generated by lib/tasks/web.rake

desc "Get info on your team's Slack channels, create or archive channels, invite users, set the topic and purpose, and mark a channel as read."
command 'channels' do |g|
  g.desc 'Delete a channel (undocumented)'
  g.long_desc %( Delete a channel )
  g.command 'delete' do |c|
    c.flag 'channel', desc: 'Channel to delete.'
    c.action do |_global_options, options, _args|
      puts JSON.dump($client.channels_delete(options))
    end
  end

  g.desc 'This method returns the ID of a team channel.'
  g.long_desc %( This method returns the ID of a team channel. )
  g.command 'id' do |c|
    c.flag 'channel', desc: 'Channel to get ID for, prefixed with #.'
    c.action do |_global_options, options, _args|
      puts JSON.dump($client.channels_id(options))
    end
  end
end