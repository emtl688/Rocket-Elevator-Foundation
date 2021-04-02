# frozen_string_literal: true
# This file was auto-generated by lib/tasks/web.rake

module Slack
  module Web
    module Api
      module Endpoints
        module AdminUsersSession
          #
          # Revoke a single session for a user. The user will be forced to login to Slack.
          #
          # @option options [Object] :session_id
          #   ID of the session to invalidate.
          # @option options [Object] :team_id
          #   ID of the workspace that the session belongs to.
          # @see https://api.slack.com/methods/admin.users.session.invalidate
          # @see https://github.com/slack-ruby/slack-api-ref/blob/master/methods/admin.users.session/admin.users.session.invalidate.json
          def admin_users_session_invalidate(options = {})
            throw ArgumentError.new('Required arguments :session_id missing') if options[:session_id].nil?
            throw ArgumentError.new('Required arguments :team_id missing') if options[:team_id].nil?
            post('admin.users.session.invalidate', options)
          end

          #
          # List active user sessions for an organization
          #
          # @option options [Object] :cursor
          #   Set cursor to next_cursor returned by the previous call to list items in the next page.
          # @option options [Object] :limit
          #   The maximum number of items to return. Must be between 1 - 1000 both inclusive.
          # @option options [Object] :team_id
          #   The ID of the workspace you'd like active sessions for. If you pass a team_id, you'll need to pass a user_id as well.
          # @option options [Object] :user_id
          #   The ID of user you'd like active sessions for. If you pass a user_id, you'll need to pass a team_id as well.
          # @see https://api.slack.com/methods/admin.users.session.list
          # @see https://github.com/slack-ruby/slack-api-ref/blob/master/methods/admin.users.session/admin.users.session.list.json
          def admin_users_session_list(options = {})
            if block_given?
              Pagination::Cursor.new(self, :admin_users_session_list, options).each do |page|
                yield page
              end
            else
              post('admin.users.session.list', options)
            end
          end

          #
          # Wipes all valid sessions on all devices for a given user
          #
          # @option options [Object] :user_id
          #   The ID of the user to wipe sessions for.
          # @option options [Object] :mobile_only
          #   Only expire mobile sessions (default: false).
          # @option options [Object] :web_only
          #   Only expire web sessions (default: false).
          # @see https://api.slack.com/methods/admin.users.session.reset
          # @see https://github.com/slack-ruby/slack-api-ref/blob/master/methods/admin.users.session/admin.users.session.reset.json
          def admin_users_session_reset(options = {})
            throw ArgumentError.new('Required arguments :user_id missing') if options[:user_id].nil?
            post('admin.users.session.reset', options)
          end
        end
      end
    end
  end
end