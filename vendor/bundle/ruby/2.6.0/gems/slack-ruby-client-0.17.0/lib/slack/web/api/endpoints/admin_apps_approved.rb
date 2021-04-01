# frozen_string_literal: true
# This file was auto-generated by lib/tasks/web.rake

module Slack
  module Web
    module Api
      module Endpoints
        module AdminAppsApproved
          #
          # List approved apps for an org or workspace.
          #
          # @option options [Object] :cursor
          #   Set cursor to next_cursor returned by the previous call to list items in the next page.
          # @option options [Object] :enterprise_id
          #   .
          # @option options [Object] :limit
          #   The maximum number of items to return. Must be between 1 - 1000 both inclusive.
          # @option options [Object] :team_id
          #   .
          # @see https://api.slack.com/methods/admin.apps.approved.list
          # @see https://github.com/slack-ruby/slack-api-ref/blob/master/methods/admin.apps.approved/admin.apps.approved.list.json
          def admin_apps_approved_list(options = {})
            if block_given?
              Pagination::Cursor.new(self, :admin_apps_approved_list, options).each do |page|
                yield page
              end
            else
              post('admin.apps.approved.list', options)
            end
          end
        end
      end
    end
  end
end
