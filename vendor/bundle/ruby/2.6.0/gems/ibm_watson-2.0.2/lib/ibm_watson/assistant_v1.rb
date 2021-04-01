# frozen_string_literal: true

# (C) Copyright IBM Corp. 2018, 2020.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# IBM OpenAPI SDK Code Generator Version: 3.19.0-be3b4618-20201113-200858
#
# The IBM Watson&trade; Assistant service combines machine learning, natural language
# understanding, and an integrated dialog editor to create conversation flows between your
# apps and your users.
#
# The Assistant v1 API provides authoring methods your application can use to create or
# update a workspace.

require "concurrent"
require "erb"
require "json"
require "ibm_cloud_sdk_core"
require_relative "./common.rb"

# Module for the Watson APIs
module IBMWatson
  ##
  # The Assistant V1 service.
  class AssistantV1 < IBMCloudSdkCore::BaseService
    include Concurrent::Async
    DEFAULT_SERVICE_NAME = "assistant"
    DEFAULT_SERVICE_URL = "https://api.us-south.assistant.watson.cloud.ibm.com"
    attr_accessor :version
    ##
    # @!method initialize(args)
    # Construct a new client for the Assistant service.
    #
    # @param args [Hash] The args to initialize with
    # @option args version [String] Release date of the API version you want to use. Specify dates in YYYY-MM-DD
    #   format. The current version is `2020-04-01`.
    # @option args service_url [String] The base service URL to use when contacting the service.
    #   The base service_url may differ between IBM Cloud regions.
    # @option args authenticator [Object] The Authenticator instance to be configured for this service.
    # @option args service_name [String] The name of the service to configure. Will be used as the key to load
    #   any external configuration, if applicable.
    def initialize(args = {})
      @__async_initialized__ = false
      defaults = {}
      defaults[:service_url] = DEFAULT_SERVICE_URL
      defaults[:service_name] = DEFAULT_SERVICE_NAME
      defaults[:authenticator] = nil
      defaults[:version] = nil
      user_service_url = args[:service_url] unless args[:service_url].nil?
      args = defaults.merge(args)
      @version = args[:version]
      raise ArgumentError.new("version must be provided") if @version.nil?

      args[:authenticator] = IBMCloudSdkCore::ConfigBasedAuthenticatorFactory.new.get_authenticator(service_name: args[:service_name]) if args[:authenticator].nil?
      super
      @service_url = user_service_url unless user_service_url.nil?
    end

    #########################
    # Message
    #########################

    ##
    # @!method message(workspace_id:, input: nil, intents: nil, entities: nil, alternate_intents: nil, context: nil, output: nil, nodes_visited_details: nil)
    # Get response to user input.
    # Send user input to a workspace and receive a response.
    #
    #   **Important:** This method has been superseded by the new v2 runtime API. The v2
    #   API offers significant advantages, including ease of deployment, automatic state
    #   management, versioning, and search capabilities. For more information, see the
    #   [documentation](https://cloud.ibm.com/docs/assistant?topic=assistant-api-overview).
    # @param workspace_id [String] Unique identifier of the workspace.
    # @param input [MessageInput] An input object that includes the input text.
    # @param intents [Array[RuntimeIntent]] Intents to use when evaluating the user input. Include intents from the previous
    #   response to continue using those intents rather than trying to recognize intents
    #   in the new input.
    # @param entities [Array[RuntimeEntity]] Entities to use when evaluating the message. Include entities from the previous
    #   response to continue using those entities rather than detecting entities in the
    #   new input.
    # @param alternate_intents [Boolean] Whether to return more than one intent. A value of `true` indicates that all
    #   matching intents are returned.
    # @param context [Context] State information for the conversation. To maintain state, include the context
    #   from the previous response.
    # @param output [OutputData] An output object that includes the response to the user, the dialog nodes that
    #   were triggered, and messages from the log.
    # @param nodes_visited_details [Boolean] Whether to include additional diagnostic information about the dialog nodes that
    #   were visited during processing of the message.
    # @return [IBMCloudSdkCore::DetailedResponse] A `IBMCloudSdkCore::DetailedResponse` object representing the response.
    def message(workspace_id:, input: nil, intents: nil, entities: nil, alternate_intents: nil, context: nil, output: nil, nodes_visited_details: nil)
      raise ArgumentError.new("workspace_id must be provided") if workspace_id.nil?

      raise ArgumentError.new("version must be provided") if version.nil?

      headers = {
      }
      sdk_headers = Common.new.get_sdk_headers("conversation", "V1", "message")
      headers.merge!(sdk_headers)

      params = {
        "version" => @version,
        "nodes_visited_details" => nodes_visited_details
      }

      data = {
        "input" => input,
        "intents" => intents,
        "entities" => entities,
        "alternate_intents" => alternate_intents,
        "context" => context,
        "output" => output
      }

      method_url = "/v1/workspaces/%s/message" % [ERB::Util.url_encode(workspace_id)]

      response = request(
        method: "POST",
        url: method_url,
        headers: headers,
        params: params,
        json: data,
        accept_json: true
      )
      response
    end
    #########################
    # Workspaces
    #########################

    ##
    # @!method list_workspaces(page_limit: nil, include_count: nil, sort: nil, cursor: nil, include_audit: nil)
    # List workspaces.
    # List the workspaces associated with a Watson Assistant service instance.
    # @param page_limit [Fixnum] The number of records to return in each page of results.
    # @param include_count [Boolean] Whether to include information about the number of records that satisfy the
    #   request, regardless of the page limit. If this parameter is `true`, the
    #   `pagination` object in the response includes the `total` property.
    # @param sort [String] The attribute by which returned workspaces will be sorted. To reverse the sort
    #   order, prefix the value with a minus sign (`-`).
    # @param cursor [String] A token identifying the page of results to retrieve.
    # @param include_audit [Boolean] Whether to include the audit properties (`created` and `updated` timestamps) in
    #   the response.
    # @return [IBMCloudSdkCore::DetailedResponse] A `IBMCloudSdkCore::DetailedResponse` object representing the response.
    def list_workspaces(page_limit: nil, include_count: nil, sort: nil, cursor: nil, include_audit: nil)
      raise ArgumentError.new("version must be provided") if version.nil?

      headers = {
      }
      sdk_headers = Common.new.get_sdk_headers("conversation", "V1", "list_workspaces")
      headers.merge!(sdk_headers)

      params = {
        "version" => @version,
        "page_limit" => page_limit,
        "include_count" => include_count,
        "sort" => sort,
        "cursor" => cursor,
        "include_audit" => include_audit
      }

      method_url = "/v1/workspaces"

      response = request(
        method: "GET",
        url: method_url,
        headers: headers,
        params: params,
        accept_json: true
      )
      response
    end

    ##
    # @!method create_workspace(name: nil, description: nil, language: nil, dialog_nodes: nil, counterexamples: nil, metadata: nil, learning_opt_out: nil, system_settings: nil, webhooks: nil, intents: nil, entities: nil, include_audit: nil)
    # Create workspace.
    # Create a workspace based on component objects. You must provide workspace
    #   components defining the content of the new workspace.
    # @param name [String] The name of the workspace. This string cannot contain carriage return, newline, or
    #   tab characters.
    # @param description [String] The description of the workspace. This string cannot contain carriage return,
    #   newline, or tab characters.
    # @param language [String] The language of the workspace.
    # @param dialog_nodes [Array[DialogNode]] An array of objects describing the dialog nodes in the workspace.
    # @param counterexamples [Array[Counterexample]] An array of objects defining input examples that have been marked as irrelevant
    #   input.
    # @param metadata [Hash] Any metadata related to the workspace.
    # @param learning_opt_out [Boolean] Whether training data from the workspace (including artifacts such as intents and
    #   entities) can be used by IBM for general service improvements. `true` indicates
    #   that workspace training data is not to be used.
    # @param system_settings [WorkspaceSystemSettings] Global settings for the workspace.
    # @param webhooks [Array[Webhook]]
    # @param intents [Array[CreateIntent]] An array of objects defining the intents for the workspace.
    # @param entities [Array[CreateEntity]] An array of objects describing the entities for the workspace.
    # @param include_audit [Boolean] Whether to include the audit properties (`created` and `updated` timestamps) in
    #   the response.
    # @return [IBMCloudSdkCore::DetailedResponse] A `IBMCloudSdkCore::DetailedResponse` object representing the response.
    def create_workspace(name: nil, description: nil, language: nil, dialog_nodes: nil, counterexamples: nil, metadata: nil, learning_opt_out: nil, system_settings: nil, webhooks: nil, intents: nil, entities: nil, include_audit: nil)
      raise ArgumentError.new("version must be provided") if version.nil?

      headers = {
      }
      sdk_headers = Common.new.get_sdk_headers("conversation", "V1", "create_workspace")
      headers.merge!(sdk_headers)

      params = {
        "version" => @version,
        "include_audit" => include_audit
      }

      data = {
        "name" => name,
        "description" => description,
        "language" => language,
        "dialog_nodes" => dialog_nodes,
        "counterexamples" => counterexamples,
        "metadata" => metadata,
        "learning_opt_out" => learning_opt_out,
        "system_settings" => system_settings,
        "webhooks" => webhooks,
        "intents" => intents,
        "entities" => entities
      }

      method_url = "/v1/workspaces"

      response = request(
        method: "POST",
        url: method_url,
        headers: headers,
        params: params,
        json: data,
        accept_json: true
      )
      response
    end

    ##
    # @!method get_workspace(workspace_id:, export: nil, include_audit: nil, sort: nil)
    # Get information about a workspace.
    # Get information about a workspace, optionally including all workspace content.
    # @param workspace_id [String] Unique identifier of the workspace.
    # @param export [Boolean] Whether to include all element content in the returned data. If
    #   **export**=`false`, the returned data includes only information about the element
    #   itself. If **export**=`true`, all content, including subelements, is included.
    # @param include_audit [Boolean] Whether to include the audit properties (`created` and `updated` timestamps) in
    #   the response.
    # @param sort [String] Indicates how the returned workspace data will be sorted. This parameter is valid
    #   only if **export**=`true`. Specify `sort=stable` to sort all workspace objects by
    #   unique identifier, in ascending alphabetical order.
    # @return [IBMCloudSdkCore::DetailedResponse] A `IBMCloudSdkCore::DetailedResponse` object representing the response.
    def get_workspace(workspace_id:, export: nil, include_audit: nil, sort: nil)
      raise ArgumentError.new("workspace_id must be provided") if workspace_id.nil?

      raise ArgumentError.new("version must be provided") if version.nil?

      headers = {
      }
      sdk_headers = Common.new.get_sdk_headers("conversation", "V1", "get_workspace")
      headers.merge!(sdk_headers)

      params = {
        "version" => @version,
        "export" => export,
        "include_audit" => include_audit,
        "sort" => sort
      }

      method_url = "/v1/workspaces/%s" % [ERB::Util.url_encode(workspace_id)]

      response = request(
        method: "GET",
        url: method_url,
        headers: headers,
        params: params,
        accept_json: true
      )
      response
    end

    ##
    # @!method update_workspace(workspace_id:, name: nil, description: nil, language: nil, dialog_nodes: nil, counterexamples: nil, metadata: nil, learning_opt_out: nil, system_settings: nil, webhooks: nil, intents: nil, entities: nil, append: nil, include_audit: nil)
    # Update workspace.
    # Update an existing workspace with new or modified data. You must provide component
    #   objects defining the content of the updated workspace.
    # @param workspace_id [String] Unique identifier of the workspace.
    # @param name [String] The name of the workspace. This string cannot contain carriage return, newline, or
    #   tab characters.
    # @param description [String] The description of the workspace. This string cannot contain carriage return,
    #   newline, or tab characters.
    # @param language [String] The language of the workspace.
    # @param dialog_nodes [Array[DialogNode]] An array of objects describing the dialog nodes in the workspace.
    # @param counterexamples [Array[Counterexample]] An array of objects defining input examples that have been marked as irrelevant
    #   input.
    # @param metadata [Hash] Any metadata related to the workspace.
    # @param learning_opt_out [Boolean] Whether training data from the workspace (including artifacts such as intents and
    #   entities) can be used by IBM for general service improvements. `true` indicates
    #   that workspace training data is not to be used.
    # @param system_settings [WorkspaceSystemSettings] Global settings for the workspace.
    # @param webhooks [Array[Webhook]]
    # @param intents [Array[CreateIntent]] An array of objects defining the intents for the workspace.
    # @param entities [Array[CreateEntity]] An array of objects describing the entities for the workspace.
    # @param append [Boolean] Whether the new data is to be appended to the existing data in the object. If
    #   **append**=`false`, elements included in the new data completely replace the
    #   corresponding existing elements, including all subelements. For example, if the
    #   new data for a workspace includes **entities** and **append**=`false`, all
    #   existing entities in the workspace are discarded and replaced with the new
    #   entities.
    #
    #   If **append**=`true`, existing elements are preserved, and the new elements are
    #   added. If any elements in the new data collide with existing elements, the update
    #   request fails.
    # @param include_audit [Boolean] Whether to include the audit properties (`created` and `updated` timestamps) in
    #   the response.
    # @return [IBMCloudSdkCore::DetailedResponse] A `IBMCloudSdkCore::DetailedResponse` object representing the response.
    def update_workspace(workspace_id:, name: nil, description: nil, language: nil, dialog_nodes: nil, counterexamples: nil, metadata: nil, learning_opt_out: nil, system_settings: nil, webhooks: nil, intents: nil, entities: nil, append: nil, include_audit: nil)
      raise ArgumentError.new("workspace_id must be provided") if workspace_id.nil?

      raise ArgumentError.new("version must be provided") if version.nil?

      headers = {
      }
      sdk_headers = Common.new.get_sdk_headers("conversation", "V1", "update_workspace")
      headers.merge!(sdk_headers)

      params = {
        "version" => @version,
        "append" => append,
        "include_audit" => include_audit
      }

      data = {
        "name" => name,
        "description" => description,
        "language" => language,
        "dialog_nodes" => dialog_nodes,
        "counterexamples" => counterexamples,
        "metadata" => metadata,
        "learning_opt_out" => learning_opt_out,
        "system_settings" => system_settings,
        "webhooks" => webhooks,
        "intents" => intents,
        "entities" => entities
      }

      method_url = "/v1/workspaces/%s" % [ERB::Util.url_encode(workspace_id)]

      response = request(
        method: "POST",
        url: method_url,
        headers: headers,
        params: params,
        json: data,
        accept_json: true
      )
      response
    end

    ##
    # @!method delete_workspace(workspace_id:)
    # Delete workspace.
    # Delete a workspace from the service instance.
    # @param workspace_id [String] Unique identifier of the workspace.
    # @return [nil]
    def delete_workspace(workspace_id:)
      raise ArgumentError.new("workspace_id must be provided") if workspace_id.nil?

      raise ArgumentError.new("version must be provided") if version.nil?

      headers = {
      }
      sdk_headers = Common.new.get_sdk_headers("conversation", "V1", "delete_workspace")
      headers.merge!(sdk_headers)

      params = {
        "version" => @version
      }

      method_url = "/v1/workspaces/%s" % [ERB::Util.url_encode(workspace_id)]

      request(
        method: "DELETE",
        url: method_url,
        headers: headers,
        params: params,
        accept_json: true
      )
      nil
    end
    #########################
    # Intents
    #########################

    ##
    # @!method list_intents(workspace_id:, export: nil, page_limit: nil, include_count: nil, sort: nil, cursor: nil, include_audit: nil)
    # List intents.
    # List the intents for a workspace.
    # @param workspace_id [String] Unique identifier of the workspace.
    # @param export [Boolean] Whether to include all element content in the returned data. If
    #   **export**=`false`, the returned data includes only information about the element
    #   itself. If **export**=`true`, all content, including subelements, is included.
    # @param page_limit [Fixnum] The number of records to return in each page of results.
    # @param include_count [Boolean] Whether to include information about the number of records that satisfy the
    #   request, regardless of the page limit. If this parameter is `true`, the
    #   `pagination` object in the response includes the `total` property.
    # @param sort [String] The attribute by which returned intents will be sorted. To reverse the sort order,
    #   prefix the value with a minus sign (`-`).
    # @param cursor [String] A token identifying the page of results to retrieve.
    # @param include_audit [Boolean] Whether to include the audit properties (`created` and `updated` timestamps) in
    #   the response.
    # @return [IBMCloudSdkCore::DetailedResponse] A `IBMCloudSdkCore::DetailedResponse` object representing the response.
    def list_intents(workspace_id:, export: nil, page_limit: nil, include_count: nil, sort: nil, cursor: nil, include_audit: nil)
      raise ArgumentError.new("workspace_id must be provided") if workspace_id.nil?

      raise ArgumentError.new("version must be provided") if version.nil?

      headers = {
      }
      sdk_headers = Common.new.get_sdk_headers("conversation", "V1", "list_intents")
      headers.merge!(sdk_headers)

      params = {
        "version" => @version,
        "export" => export,
        "page_limit" => page_limit,
        "include_count" => include_count,
        "sort" => sort,
        "cursor" => cursor,
        "include_audit" => include_audit
      }

      method_url = "/v1/workspaces/%s/intents" % [ERB::Util.url_encode(workspace_id)]

      response = request(
        method: "GET",
        url: method_url,
        headers: headers,
        params: params,
        accept_json: true
      )
      response
    end

    ##
    # @!method create_intent(workspace_id:, intent:, description: nil, examples: nil, include_audit: nil)
    # Create intent.
    # Create a new intent.
    #
    #   If you want to create multiple intents with a single API call, consider using the
    #   **[Update workspace](#update-workspace)** method instead.
    # @param workspace_id [String] Unique identifier of the workspace.
    # @param intent [String] The name of the intent. This string must conform to the following restrictions:
    #   - It can contain only Unicode alphanumeric, underscore, hyphen, and dot
    #   characters.
    #   - It cannot begin with the reserved prefix `sys-`.
    # @param description [String] The description of the intent. This string cannot contain carriage return,
    #   newline, or tab characters.
    # @param examples [Array[Example]] An array of user input examples for the intent.
    # @param include_audit [Boolean] Whether to include the audit properties (`created` and `updated` timestamps) in
    #   the response.
    # @return [IBMCloudSdkCore::DetailedResponse] A `IBMCloudSdkCore::DetailedResponse` object representing the response.
    def create_intent(workspace_id:, intent:, description: nil, examples: nil, include_audit: nil)
      raise ArgumentError.new("workspace_id must be provided") if workspace_id.nil?

      raise ArgumentError.new("version must be provided") if version.nil?

      raise ArgumentError.new("intent must be provided") if intent.nil?

      headers = {
      }
      sdk_headers = Common.new.get_sdk_headers("conversation", "V1", "create_intent")
      headers.merge!(sdk_headers)

      params = {
        "version" => @version,
        "include_audit" => include_audit
      }

      data = {
        "intent" => intent,
        "description" => description,
        "examples" => examples
      }

      method_url = "/v1/workspaces/%s/intents" % [ERB::Util.url_encode(workspace_id)]

      response = request(
        method: "POST",
        url: method_url,
        headers: headers,
        params: params,
        json: data,
        accept_json: true
      )
      response
    end

    ##
    # @!method get_intent(workspace_id:, intent:, export: nil, include_audit: nil)
    # Get intent.
    # Get information about an intent, optionally including all intent content.
    # @param workspace_id [String] Unique identifier of the workspace.
    # @param intent [String] The intent name.
    # @param export [Boolean] Whether to include all element content in the returned data. If
    #   **export**=`false`, the returned data includes only information about the element
    #   itself. If **export**=`true`, all content, including subelements, is included.
    # @param include_audit [Boolean] Whether to include the audit properties (`created` and `updated` timestamps) in
    #   the response.
    # @return [IBMCloudSdkCore::DetailedResponse] A `IBMCloudSdkCore::DetailedResponse` object representing the response.
    def get_intent(workspace_id:, intent:, export: nil, include_audit: nil)
      raise ArgumentError.new("workspace_id must be provided") if workspace_id.nil?

      raise ArgumentError.new("intent must be provided") if intent.nil?

      raise ArgumentError.new("version must be provided") if version.nil?

      headers = {
      }
      sdk_headers = Common.new.get_sdk_headers("conversation", "V1", "get_intent")
      headers.merge!(sdk_headers)

      params = {
        "version" => @version,
        "export" => export,
        "include_audit" => include_audit
      }

      method_url = "/v1/workspaces/%s/intents/%s" % [ERB::Util.url_encode(workspace_id), ERB::Util.url_encode(intent)]

      response = request(
        method: "GET",
        url: method_url,
        headers: headers,
        params: params,
        accept_json: true
      )
      response
    end

    ##
    # @!method update_intent(workspace_id:, intent:, new_intent: nil, new_description: nil, new_examples: nil, append: nil, include_audit: nil)
    # Update intent.
    # Update an existing intent with new or modified data. You must provide component
    #   objects defining the content of the updated intent.
    #
    #   If you want to update multiple intents with a single API call, consider using the
    #   **[Update workspace](#update-workspace)** method instead.
    # @param workspace_id [String] Unique identifier of the workspace.
    # @param intent [String] The intent name.
    # @param new_intent [String] The name of the intent. This string must conform to the following restrictions:
    #   - It can contain only Unicode alphanumeric, underscore, hyphen, and dot
    #   characters.
    #   - It cannot begin with the reserved prefix `sys-`.
    # @param new_description [String] The description of the intent. This string cannot contain carriage return,
    #   newline, or tab characters.
    # @param new_examples [Array[Example]] An array of user input examples for the intent.
    # @param append [Boolean] Whether the new data is to be appended to the existing data in the object. If
    #   **append**=`false`, elements included in the new data completely replace the
    #   corresponding existing elements, including all subelements. For example, if the
    #   new data for the intent includes **examples** and **append**=`false`, all existing
    #   examples for the intent are discarded and replaced with the new examples.
    #
    #   If **append**=`true`, existing elements are preserved, and the new elements are
    #   added. If any elements in the new data collide with existing elements, the update
    #   request fails.
    # @param include_audit [Boolean] Whether to include the audit properties (`created` and `updated` timestamps) in
    #   the response.
    # @return [IBMCloudSdkCore::DetailedResponse] A `IBMCloudSdkCore::DetailedResponse` object representing the response.
    def update_intent(workspace_id:, intent:, new_intent: nil, new_description: nil, new_examples: nil, append: nil, include_audit: nil)
      raise ArgumentError.new("workspace_id must be provided") if workspace_id.nil?

      raise ArgumentError.new("intent must be provided") if intent.nil?

      raise ArgumentError.new("version must be provided") if version.nil?

      headers = {
      }
      sdk_headers = Common.new.get_sdk_headers("conversation", "V1", "update_intent")
      headers.merge!(sdk_headers)

      params = {
        "version" => @version,
        "append" => append,
        "include_audit" => include_audit
      }

      data = {
        "intent" => new_intent,
        "description" => new_description,
        "examples" => new_examples
      }

      method_url = "/v1/workspaces/%s/intents/%s" % [ERB::Util.url_encode(workspace_id), ERB::Util.url_encode(intent)]

      response = request(
        method: "POST",
        url: method_url,
        headers: headers,
        params: params,
        json: data,
        accept_json: true
      )
      response
    end

    ##
    # @!method delete_intent(workspace_id:, intent:)
    # Delete intent.
    # Delete an intent from a workspace.
    # @param workspace_id [String] Unique identifier of the workspace.
    # @param intent [String] The intent name.
    # @return [nil]
    def delete_intent(workspace_id:, intent:)
      raise ArgumentError.new("workspace_id must be provided") if workspace_id.nil?

      raise ArgumentError.new("intent must be provided") if intent.nil?

      raise ArgumentError.new("version must be provided") if version.nil?

      headers = {
      }
      sdk_headers = Common.new.get_sdk_headers("conversation", "V1", "delete_intent")
      headers.merge!(sdk_headers)

      params = {
        "version" => @version
      }

      method_url = "/v1/workspaces/%s/intents/%s" % [ERB::Util.url_encode(workspace_id), ERB::Util.url_encode(intent)]

      request(
        method: "DELETE",
        url: method_url,
        headers: headers,
        params: params,
        accept_json: true
      )
      nil
    end
    #########################
    # Examples
    #########################

    ##
    # @!method list_examples(workspace_id:, intent:, page_limit: nil, include_count: nil, sort: nil, cursor: nil, include_audit: nil)
    # List user input examples.
    # List the user input examples for an intent, optionally including contextual entity
    #   mentions.
    # @param workspace_id [String] Unique identifier of the workspace.
    # @param intent [String] The intent name.
    # @param page_limit [Fixnum] The number of records to return in each page of results.
    # @param include_count [Boolean] Whether to include information about the number of records that satisfy the
    #   request, regardless of the page limit. If this parameter is `true`, the
    #   `pagination` object in the response includes the `total` property.
    # @param sort [String] The attribute by which returned examples will be sorted. To reverse the sort
    #   order, prefix the value with a minus sign (`-`).
    # @param cursor [String] A token identifying the page of results to retrieve.
    # @param include_audit [Boolean] Whether to include the audit properties (`created` and `updated` timestamps) in
    #   the response.
    # @return [IBMCloudSdkCore::DetailedResponse] A `IBMCloudSdkCore::DetailedResponse` object representing the response.
    def list_examples(workspace_id:, intent:, page_limit: nil, include_count: nil, sort: nil, cursor: nil, include_audit: nil)
      raise ArgumentError.new("workspace_id must be provided") if workspace_id.nil?

      raise ArgumentError.new("intent must be provided") if intent.nil?

      raise ArgumentError.new("version must be provided") if version.nil?

      headers = {
      }
      sdk_headers = Common.new.get_sdk_headers("conversation", "V1", "list_examples")
      headers.merge!(sdk_headers)

      params = {
        "version" => @version,
        "page_limit" => page_limit,
        "include_count" => include_count,
        "sort" => sort,
        "cursor" => cursor,
        "include_audit" => include_audit
      }

      method_url = "/v1/workspaces/%s/intents/%s/examples" % [ERB::Util.url_encode(workspace_id), ERB::Util.url_encode(intent)]

      response = request(
        method: "GET",
        url: method_url,
        headers: headers,
        params: params,
        accept_json: true
      )
      response
    end

    ##
    # @!method create_example(workspace_id:, intent:, text:, mentions: nil, include_audit: nil)
    # Create user input example.
    # Add a new user input example to an intent.
    #
    #   If you want to add multiple examples with a single API call, consider using the
    #   **[Update intent](#update-intent)** method instead.
    # @param workspace_id [String] Unique identifier of the workspace.
    # @param intent [String] The intent name.
    # @param text [String] The text of a user input example. This string must conform to the following
    #   restrictions:
    #   - It cannot contain carriage return, newline, or tab characters.
    #   - It cannot consist of only whitespace characters.
    # @param mentions [Array[Mention]] An array of contextual entity mentions.
    # @param include_audit [Boolean] Whether to include the audit properties (`created` and `updated` timestamps) in
    #   the response.
    # @return [IBMCloudSdkCore::DetailedResponse] A `IBMCloudSdkCore::DetailedResponse` object representing the response.
    def create_example(workspace_id:, intent:, text:, mentions: nil, include_audit: nil)
      raise ArgumentError.new("workspace_id must be provided") if workspace_id.nil?

      raise ArgumentError.new("intent must be provided") if intent.nil?

      raise ArgumentError.new("version must be provided") if version.nil?

      raise ArgumentError.new("text must be provided") if text.nil?

      headers = {
      }
      sdk_headers = Common.new.get_sdk_headers("conversation", "V1", "create_example")
      headers.merge!(sdk_headers)

      params = {
        "version" => @version,
        "include_audit" => include_audit
      }

      data = {
        "text" => text,
        "mentions" => mentions
      }

      method_url = "/v1/workspaces/%s/intents/%s/examples" % [ERB::Util.url_encode(workspace_id), ERB::Util.url_encode(intent)]

      response = request(
        method: "POST",
        url: method_url,
        headers: headers,
        params: params,
        json: data,
        accept_json: true
      )
      response
    end

    ##
    # @!method get_example(workspace_id:, intent:, text:, include_audit: nil)
    # Get user input example.
    # Get information about a user input example.
    # @param workspace_id [String] Unique identifier of the workspace.
    # @param intent [String] The intent name.
    # @param text [String] The text of the user input example.
    # @param include_audit [Boolean] Whether to include the audit properties (`created` and `updated` timestamps) in
    #   the response.
    # @return [IBMCloudSdkCore::DetailedResponse] A `IBMCloudSdkCore::DetailedResponse` object representing the response.
    def get_example(workspace_id:, intent:, text:, include_audit: nil)
      raise ArgumentError.new("workspace_id must be provided") if workspace_id.nil?

      raise ArgumentError.new("intent must be provided") if intent.nil?

      raise ArgumentError.new("text must be provided") if text.nil?

      raise ArgumentError.new("version must be provided") if version.nil?

      headers = {
      }
      sdk_headers = Common.new.get_sdk_headers("conversation", "V1", "get_example")
      headers.merge!(sdk_headers)

      params = {
        "version" => @version,
        "include_audit" => include_audit
      }

      method_url = "/v1/workspaces/%s/intents/%s/examples/%s" % [ERB::Util.url_encode(workspace_id), ERB::Util.url_encode(intent), ERB::Util.url_encode(text)]

      response = request(
        method: "GET",
        url: method_url,
        headers: headers,
        params: params,
        accept_json: true
      )
      response
    end

    ##
    # @!method update_example(workspace_id:, intent:, text:, new_text: nil, new_mentions: nil, include_audit: nil)
    # Update user input example.
    # Update the text of a user input example.
    #
    #   If you want to update multiple examples with a single API call, consider using the
    #   **[Update intent](#update-intent)** method instead.
    # @param workspace_id [String] Unique identifier of the workspace.
    # @param intent [String] The intent name.
    # @param text [String] The text of the user input example.
    # @param new_text [String] The text of the user input example. This string must conform to the following
    #   restrictions:
    #   - It cannot contain carriage return, newline, or tab characters.
    #   - It cannot consist of only whitespace characters.
    # @param new_mentions [Array[Mention]] An array of contextual entity mentions.
    # @param include_audit [Boolean] Whether to include the audit properties (`created` and `updated` timestamps) in
    #   the response.
    # @return [IBMCloudSdkCore::DetailedResponse] A `IBMCloudSdkCore::DetailedResponse` object representing the response.
    def update_example(workspace_id:, intent:, text:, new_text: nil, new_mentions: nil, include_audit: nil)
      raise ArgumentError.new("workspace_id must be provided") if workspace_id.nil?

      raise ArgumentError.new("intent must be provided") if intent.nil?

      raise ArgumentError.new("text must be provided") if text.nil?

      raise ArgumentError.new("version must be provided") if version.nil?

      headers = {
      }
      sdk_headers = Common.new.get_sdk_headers("conversation", "V1", "update_example")
      headers.merge!(sdk_headers)

      params = {
        "version" => @version,
        "include_audit" => include_audit
      }

      data = {
        "text" => new_text,
        "mentions" => new_mentions
      }

      method_url = "/v1/workspaces/%s/intents/%s/examples/%s" % [ERB::Util.url_encode(workspace_id), ERB::Util.url_encode(intent), ERB::Util.url_encode(text)]

      response = request(
        method: "POST",
        url: method_url,
        headers: headers,
        params: params,
        json: data,
        accept_json: true
      )
      response
    end

    ##
    # @!method delete_example(workspace_id:, intent:, text:)
    # Delete user input example.
    # Delete a user input example from an intent.
    # @param workspace_id [String] Unique identifier of the workspace.
    # @param intent [String] The intent name.
    # @param text [String] The text of the user input example.
    # @return [nil]
    def delete_example(workspace_id:, intent:, text:)
      raise ArgumentError.new("workspace_id must be provided") if workspace_id.nil?

      raise ArgumentError.new("intent must be provided") if intent.nil?

      raise ArgumentError.new("text must be provided") if text.nil?

      raise ArgumentError.new("version must be provided") if version.nil?

      headers = {
      }
      sdk_headers = Common.new.get_sdk_headers("conversation", "V1", "delete_example")
      headers.merge!(sdk_headers)

      params = {
        "version" => @version
      }

      method_url = "/v1/workspaces/%s/intents/%s/examples/%s" % [ERB::Util.url_encode(workspace_id), ERB::Util.url_encode(intent), ERB::Util.url_encode(text)]

      request(
        method: "DELETE",
        url: method_url,
        headers: headers,
        params: params,
        accept_json: true
      )
      nil
    end
    #########################
    # Counterexamples
    #########################

    ##
    # @!method list_counterexamples(workspace_id:, page_limit: nil, include_count: nil, sort: nil, cursor: nil, include_audit: nil)
    # List counterexamples.
    # List the counterexamples for a workspace. Counterexamples are examples that have
    #   been marked as irrelevant input.
    # @param workspace_id [String] Unique identifier of the workspace.
    # @param page_limit [Fixnum] The number of records to return in each page of results.
    # @param include_count [Boolean] Whether to include information about the number of records that satisfy the
    #   request, regardless of the page limit. If this parameter is `true`, the
    #   `pagination` object in the response includes the `total` property.
    # @param sort [String] The attribute by which returned counterexamples will be sorted. To reverse the
    #   sort order, prefix the value with a minus sign (`-`).
    # @param cursor [String] A token identifying the page of results to retrieve.
    # @param include_audit [Boolean] Whether to include the audit properties (`created` and `updated` timestamps) in
    #   the response.
    # @return [IBMCloudSdkCore::DetailedResponse] A `IBMCloudSdkCore::DetailedResponse` object representing the response.
    def list_counterexamples(workspace_id:, page_limit: nil, include_count: nil, sort: nil, cursor: nil, include_audit: nil)
      raise ArgumentError.new("workspace_id must be provided") if workspace_id.nil?

      raise ArgumentError.new("version must be provided") if version.nil?

      headers = {
      }
      sdk_headers = Common.new.get_sdk_headers("conversation", "V1", "list_counterexamples")
      headers.merge!(sdk_headers)

      params = {
        "version" => @version,
        "page_limit" => page_limit,
        "include_count" => include_count,
        "sort" => sort,
        "cursor" => cursor,
        "include_audit" => include_audit
      }

      method_url = "/v1/workspaces/%s/counterexamples" % [ERB::Util.url_encode(workspace_id)]

      response = request(
        method: "GET",
        url: method_url,
        headers: headers,
        params: params,
        accept_json: true
      )
      response
    end

    ##
    # @!method create_counterexample(workspace_id:, text:, include_audit: nil)
    # Create counterexample.
    # Add a new counterexample to a workspace. Counterexamples are examples that have
    #   been marked as irrelevant input.
    #
    #   If you want to add multiple counterexamples with a single API call, consider using
    #   the **[Update workspace](#update-workspace)** method instead.
    # @param workspace_id [String] Unique identifier of the workspace.
    # @param text [String] The text of a user input marked as irrelevant input. This string must conform to
    #   the following restrictions:
    #   - It cannot contain carriage return, newline, or tab characters.
    #   - It cannot consist of only whitespace characters.
    # @param include_audit [Boolean] Whether to include the audit properties (`created` and `updated` timestamps) in
    #   the response.
    # @return [IBMCloudSdkCore::DetailedResponse] A `IBMCloudSdkCore::DetailedResponse` object representing the response.
    def create_counterexample(workspace_id:, text:, include_audit: nil)
      raise ArgumentError.new("workspace_id must be provided") if workspace_id.nil?

      raise ArgumentError.new("version must be provided") if version.nil?

      raise ArgumentError.new("text must be provided") if text.nil?

      headers = {
      }
      sdk_headers = Common.new.get_sdk_headers("conversation", "V1", "create_counterexample")
      headers.merge!(sdk_headers)

      params = {
        "version" => @version,
        "include_audit" => include_audit
      }

      data = {
        "text" => text
      }

      method_url = "/v1/workspaces/%s/counterexamples" % [ERB::Util.url_encode(workspace_id)]

      response = request(
        method: "POST",
        url: method_url,
        headers: headers,
        params: params,
        json: data,
        accept_json: true
      )
      response
    end

    ##
    # @!method get_counterexample(workspace_id:, text:, include_audit: nil)
    # Get counterexample.
    # Get information about a counterexample. Counterexamples are examples that have
    #   been marked as irrelevant input.
    # @param workspace_id [String] Unique identifier of the workspace.
    # @param text [String] The text of a user input counterexample (for example, `What are you wearing?`).
    # @param include_audit [Boolean] Whether to include the audit properties (`created` and `updated` timestamps) in
    #   the response.
    # @return [IBMCloudSdkCore::DetailedResponse] A `IBMCloudSdkCore::DetailedResponse` object representing the response.
    def get_counterexample(workspace_id:, text:, include_audit: nil)
      raise ArgumentError.new("workspace_id must be provided") if workspace_id.nil?

      raise ArgumentError.new("text must be provided") if text.nil?

      raise ArgumentError.new("version must be provided") if version.nil?

      headers = {
      }
      sdk_headers = Common.new.get_sdk_headers("conversation", "V1", "get_counterexample")
      headers.merge!(sdk_headers)

      params = {
        "version" => @version,
        "include_audit" => include_audit
      }

      method_url = "/v1/workspaces/%s/counterexamples/%s" % [ERB::Util.url_encode(workspace_id), ERB::Util.url_encode(text)]

      response = request(
        method: "GET",
        url: method_url,
        headers: headers,
        params: params,
        accept_json: true
      )
      response
    end

    ##
    # @!method update_counterexample(workspace_id:, text:, new_text: nil, include_audit: nil)
    # Update counterexample.
    # Update the text of a counterexample. Counterexamples are examples that have been
    #   marked as irrelevant input.
    # @param workspace_id [String] Unique identifier of the workspace.
    # @param text [String] The text of a user input counterexample (for example, `What are you wearing?`).
    # @param new_text [String] The text of a user input marked as irrelevant input. This string must conform to
    #   the following restrictions:
    #   - It cannot contain carriage return, newline, or tab characters.
    #   - It cannot consist of only whitespace characters.
    # @param include_audit [Boolean] Whether to include the audit properties (`created` and `updated` timestamps) in
    #   the response.
    # @return [IBMCloudSdkCore::DetailedResponse] A `IBMCloudSdkCore::DetailedResponse` object representing the response.
    def update_counterexample(workspace_id:, text:, new_text: nil, include_audit: nil)
      raise ArgumentError.new("workspace_id must be provided") if workspace_id.nil?

      raise ArgumentError.new("text must be provided") if text.nil?

      raise ArgumentError.new("version must be provided") if version.nil?

      headers = {
      }
      sdk_headers = Common.new.get_sdk_headers("conversation", "V1", "update_counterexample")
      headers.merge!(sdk_headers)

      params = {
        "version" => @version,
        "include_audit" => include_audit
      }

      data = {
        "text" => new_text
      }

      method_url = "/v1/workspaces/%s/counterexamples/%s" % [ERB::Util.url_encode(workspace_id), ERB::Util.url_encode(text)]

      response = request(
        method: "POST",
        url: method_url,
        headers: headers,
        params: params,
        json: data,
        accept_json: true
      )
      response
    end

    ##
    # @!method delete_counterexample(workspace_id:, text:)
    # Delete counterexample.
    # Delete a counterexample from a workspace. Counterexamples are examples that have
    #   been marked as irrelevant input.
    # @param workspace_id [String] Unique identifier of the workspace.
    # @param text [String] The text of a user input counterexample (for example, `What are you wearing?`).
    # @return [nil]
    def delete_counterexample(workspace_id:, text:)
      raise ArgumentError.new("workspace_id must be provided") if workspace_id.nil?

      raise ArgumentError.new("text must be provided") if text.nil?

      raise ArgumentError.new("version must be provided") if version.nil?

      headers = {
      }
      sdk_headers = Common.new.get_sdk_headers("conversation", "V1", "delete_counterexample")
      headers.merge!(sdk_headers)

      params = {
        "version" => @version
      }

      method_url = "/v1/workspaces/%s/counterexamples/%s" % [ERB::Util.url_encode(workspace_id), ERB::Util.url_encode(text)]

      request(
        method: "DELETE",
        url: method_url,
        headers: headers,
        params: params,
        accept_json: true
      )
      nil
    end
    #########################
    # Entities
    #########################

    ##
    # @!method list_entities(workspace_id:, export: nil, page_limit: nil, include_count: nil, sort: nil, cursor: nil, include_audit: nil)
    # List entities.
    # List the entities for a workspace.
    # @param workspace_id [String] Unique identifier of the workspace.
    # @param export [Boolean] Whether to include all element content in the returned data. If
    #   **export**=`false`, the returned data includes only information about the element
    #   itself. If **export**=`true`, all content, including subelements, is included.
    # @param page_limit [Fixnum] The number of records to return in each page of results.
    # @param include_count [Boolean] Whether to include information about the number of records that satisfy the
    #   request, regardless of the page limit. If this parameter is `true`, the
    #   `pagination` object in the response includes the `total` property.
    # @param sort [String] The attribute by which returned entities will be sorted. To reverse the sort
    #   order, prefix the value with a minus sign (`-`).
    # @param cursor [String] A token identifying the page of results to retrieve.
    # @param include_audit [Boolean] Whether to include the audit properties (`created` and `updated` timestamps) in
    #   the response.
    # @return [IBMCloudSdkCore::DetailedResponse] A `IBMCloudSdkCore::DetailedResponse` object representing the response.
    def list_entities(workspace_id:, export: nil, page_limit: nil, include_count: nil, sort: nil, cursor: nil, include_audit: nil)
      raise ArgumentError.new("workspace_id must be provided") if workspace_id.nil?

      raise ArgumentError.new("version must be provided") if version.nil?

      headers = {
      }
      sdk_headers = Common.new.get_sdk_headers("conversation", "V1", "list_entities")
      headers.merge!(sdk_headers)

      params = {
        "version" => @version,
        "export" => export,
        "page_limit" => page_limit,
        "include_count" => include_count,
        "sort" => sort,
        "cursor" => cursor,
        "include_audit" => include_audit
      }

      method_url = "/v1/workspaces/%s/entities" % [ERB::Util.url_encode(workspace_id)]

      response = request(
        method: "GET",
        url: method_url,
        headers: headers,
        params: params,
        accept_json: true
      )
      response
    end

    ##
    # @!method create_entity(workspace_id:, entity:, description: nil, metadata: nil, fuzzy_match: nil, values: nil, include_audit: nil)
    # Create entity.
    # Create a new entity, or enable a system entity.
    #
    #   If you want to create multiple entities with a single API call, consider using the
    #   **[Update workspace](#update-workspace)** method instead.
    # @param workspace_id [String] Unique identifier of the workspace.
    # @param entity [String] The name of the entity. This string must conform to the following restrictions:
    #   - It can contain only Unicode alphanumeric, underscore, and hyphen characters.
    #   - If you specify an entity name beginning with the reserved prefix `sys-`, it must
    #   be the name of a system entity that you want to enable. (Any entity content
    #   specified with the request is ignored.).
    # @param description [String] The description of the entity. This string cannot contain carriage return,
    #   newline, or tab characters.
    # @param metadata [Hash] Any metadata related to the entity.
    # @param fuzzy_match [Boolean] Whether to use fuzzy matching for the entity.
    # @param values [Array[CreateValue]] An array of objects describing the entity values.
    # @param include_audit [Boolean] Whether to include the audit properties (`created` and `updated` timestamps) in
    #   the response.
    # @return [IBMCloudSdkCore::DetailedResponse] A `IBMCloudSdkCore::DetailedResponse` object representing the response.
    def create_entity(workspace_id:, entity:, description: nil, metadata: nil, fuzzy_match: nil, values: nil, include_audit: nil)
      raise ArgumentError.new("workspace_id must be provided") if workspace_id.nil?

      raise ArgumentError.new("version must be provided") if version.nil?

      raise ArgumentError.new("entity must be provided") if entity.nil?

      headers = {
      }
      sdk_headers = Common.new.get_sdk_headers("conversation", "V1", "create_entity")
      headers.merge!(sdk_headers)

      params = {
        "version" => @version,
        "include_audit" => include_audit
      }

      data = {
        "entity" => entity,
        "description" => description,
        "metadata" => metadata,
        "fuzzy_match" => fuzzy_match,
        "values" => values
      }

      method_url = "/v1/workspaces/%s/entities" % [ERB::Util.url_encode(workspace_id)]

      response = request(
        method: "POST",
        url: method_url,
        headers: headers,
        params: params,
        json: data,
        accept_json: true
      )
      response
    end

    ##
    # @!method get_entity(workspace_id:, entity:, export: nil, include_audit: nil)
    # Get entity.
    # Get information about an entity, optionally including all entity content.
    # @param workspace_id [String] Unique identifier of the workspace.
    # @param entity [String] The name of the entity.
    # @param export [Boolean] Whether to include all element content in the returned data. If
    #   **export**=`false`, the returned data includes only information about the element
    #   itself. If **export**=`true`, all content, including subelements, is included.
    # @param include_audit [Boolean] Whether to include the audit properties (`created` and `updated` timestamps) in
    #   the response.
    # @return [IBMCloudSdkCore::DetailedResponse] A `IBMCloudSdkCore::DetailedResponse` object representing the response.
    def get_entity(workspace_id:, entity:, export: nil, include_audit: nil)
      raise ArgumentError.new("workspace_id must be provided") if workspace_id.nil?

      raise ArgumentError.new("entity must be provided") if entity.nil?

      raise ArgumentError.new("version must be provided") if version.nil?

      headers = {
      }
      sdk_headers = Common.new.get_sdk_headers("conversation", "V1", "get_entity")
      headers.merge!(sdk_headers)

      params = {
        "version" => @version,
        "export" => export,
        "include_audit" => include_audit
      }

      method_url = "/v1/workspaces/%s/entities/%s" % [ERB::Util.url_encode(workspace_id), ERB::Util.url_encode(entity)]

      response = request(
        method: "GET",
        url: method_url,
        headers: headers,
        params: params,
        accept_json: true
      )
      response
    end

    ##
    # @!method update_entity(workspace_id:, entity:, new_entity: nil, new_description: nil, new_metadata: nil, new_fuzzy_match: nil, new_values: nil, append: nil, include_audit: nil)
    # Update entity.
    # Update an existing entity with new or modified data. You must provide component
    #   objects defining the content of the updated entity.
    #
    #   If you want to update multiple entities with a single API call, consider using the
    #   **[Update workspace](#update-workspace)** method instead.
    # @param workspace_id [String] Unique identifier of the workspace.
    # @param entity [String] The name of the entity.
    # @param new_entity [String] The name of the entity. This string must conform to the following restrictions:
    #   - It can contain only Unicode alphanumeric, underscore, and hyphen characters.
    #   - It cannot begin with the reserved prefix `sys-`.
    # @param new_description [String] The description of the entity. This string cannot contain carriage return,
    #   newline, or tab characters.
    # @param new_metadata [Hash] Any metadata related to the entity.
    # @param new_fuzzy_match [Boolean] Whether to use fuzzy matching for the entity.
    # @param new_values [Array[CreateValue]] An array of objects describing the entity values.
    # @param append [Boolean] Whether the new data is to be appended to the existing data in the entity. If
    #   **append**=`false`, elements included in the new data completely replace the
    #   corresponding existing elements, including all subelements. For example, if the
    #   new data for the entity includes **values** and **append**=`false`, all existing
    #   values for the entity are discarded and replaced with the new values.
    #
    #   If **append**=`true`, existing elements are preserved, and the new elements are
    #   added. If any elements in the new data collide with existing elements, the update
    #   request fails.
    # @param include_audit [Boolean] Whether to include the audit properties (`created` and `updated` timestamps) in
    #   the response.
    # @return [IBMCloudSdkCore::DetailedResponse] A `IBMCloudSdkCore::DetailedResponse` object representing the response.
    def update_entity(workspace_id:, entity:, new_entity: nil, new_description: nil, new_metadata: nil, new_fuzzy_match: nil, new_values: nil, append: nil, include_audit: nil)
      raise ArgumentError.new("workspace_id must be provided") if workspace_id.nil?

      raise ArgumentError.new("entity must be provided") if entity.nil?

      raise ArgumentError.new("version must be provided") if version.nil?

      headers = {
      }
      sdk_headers = Common.new.get_sdk_headers("conversation", "V1", "update_entity")
      headers.merge!(sdk_headers)

      params = {
        "version" => @version,
        "append" => append,
        "include_audit" => include_audit
      }

      data = {
        "entity" => new_entity,
        "description" => new_description,
        "metadata" => new_metadata,
        "fuzzy_match" => new_fuzzy_match,
        "values" => new_values
      }

      method_url = "/v1/workspaces/%s/entities/%s" % [ERB::Util.url_encode(workspace_id), ERB::Util.url_encode(entity)]

      response = request(
        method: "POST",
        url: method_url,
        headers: headers,
        params: params,
        json: data,
        accept_json: true
      )
      response
    end

    ##
    # @!method delete_entity(workspace_id:, entity:)
    # Delete entity.
    # Delete an entity from a workspace, or disable a system entity.
    # @param workspace_id [String] Unique identifier of the workspace.
    # @param entity [String] The name of the entity.
    # @return [nil]
    def delete_entity(workspace_id:, entity:)
      raise ArgumentError.new("workspace_id must be provided") if workspace_id.nil?

      raise ArgumentError.new("entity must be provided") if entity.nil?

      raise ArgumentError.new("version must be provided") if version.nil?

      headers = {
      }
      sdk_headers = Common.new.get_sdk_headers("conversation", "V1", "delete_entity")
      headers.merge!(sdk_headers)

      params = {
        "version" => @version
      }

      method_url = "/v1/workspaces/%s/entities/%s" % [ERB::Util.url_encode(workspace_id), ERB::Util.url_encode(entity)]

      request(
        method: "DELETE",
        url: method_url,
        headers: headers,
        params: params,
        accept_json: true
      )
      nil
    end
    #########################
    # Mentions
    #########################

    ##
    # @!method list_mentions(workspace_id:, entity:, export: nil, include_audit: nil)
    # List entity mentions.
    # List mentions for a contextual entity. An entity mention is an occurrence of a
    #   contextual entity in the context of an intent user input example.
    # @param workspace_id [String] Unique identifier of the workspace.
    # @param entity [String] The name of the entity.
    # @param export [Boolean] Whether to include all element content in the returned data. If
    #   **export**=`false`, the returned data includes only information about the element
    #   itself. If **export**=`true`, all content, including subelements, is included.
    # @param include_audit [Boolean] Whether to include the audit properties (`created` and `updated` timestamps) in
    #   the response.
    # @return [IBMCloudSdkCore::DetailedResponse] A `IBMCloudSdkCore::DetailedResponse` object representing the response.
    def list_mentions(workspace_id:, entity:, export: nil, include_audit: nil)
      raise ArgumentError.new("workspace_id must be provided") if workspace_id.nil?

      raise ArgumentError.new("entity must be provided") if entity.nil?

      raise ArgumentError.new("version must be provided") if version.nil?

      headers = {
      }
      sdk_headers = Common.new.get_sdk_headers("conversation", "V1", "list_mentions")
      headers.merge!(sdk_headers)

      params = {
        "version" => @version,
        "export" => export,
        "include_audit" => include_audit
      }

      method_url = "/v1/workspaces/%s/entities/%s/mentions" % [ERB::Util.url_encode(workspace_id), ERB::Util.url_encode(entity)]

      response = request(
        method: "GET",
        url: method_url,
        headers: headers,
        params: params,
        accept_json: true
      )
      response
    end
    #########################
    # Values
    #########################

    ##
    # @!method list_values(workspace_id:, entity:, export: nil, page_limit: nil, include_count: nil, sort: nil, cursor: nil, include_audit: nil)
    # List entity values.
    # List the values for an entity.
    # @param workspace_id [String] Unique identifier of the workspace.
    # @param entity [String] The name of the entity.
    # @param export [Boolean] Whether to include all element content in the returned data. If
    #   **export**=`false`, the returned data includes only information about the element
    #   itself. If **export**=`true`, all content, including subelements, is included.
    # @param page_limit [Fixnum] The number of records to return in each page of results.
    # @param include_count [Boolean] Whether to include information about the number of records that satisfy the
    #   request, regardless of the page limit. If this parameter is `true`, the
    #   `pagination` object in the response includes the `total` property.
    # @param sort [String] The attribute by which returned entity values will be sorted. To reverse the sort
    #   order, prefix the value with a minus sign (`-`).
    # @param cursor [String] A token identifying the page of results to retrieve.
    # @param include_audit [Boolean] Whether to include the audit properties (`created` and `updated` timestamps) in
    #   the response.
    # @return [IBMCloudSdkCore::DetailedResponse] A `IBMCloudSdkCore::DetailedResponse` object representing the response.
    def list_values(workspace_id:, entity:, export: nil, page_limit: nil, include_count: nil, sort: nil, cursor: nil, include_audit: nil)
      raise ArgumentError.new("workspace_id must be provided") if workspace_id.nil?

      raise ArgumentError.new("entity must be provided") if entity.nil?

      raise ArgumentError.new("version must be provided") if version.nil?

      headers = {
      }
      sdk_headers = Common.new.get_sdk_headers("conversation", "V1", "list_values")
      headers.merge!(sdk_headers)

      params = {
        "version" => @version,
        "export" => export,
        "page_limit" => page_limit,
        "include_count" => include_count,
        "sort" => sort,
        "cursor" => cursor,
        "include_audit" => include_audit
      }

      method_url = "/v1/workspaces/%s/entities/%s/values" % [ERB::Util.url_encode(workspace_id), ERB::Util.url_encode(entity)]

      response = request(
        method: "GET",
        url: method_url,
        headers: headers,
        params: params,
        accept_json: true
      )
      response
    end

    ##
    # @!method create_value(workspace_id:, entity:, value:, metadata: nil, type: nil, synonyms: nil, patterns: nil, include_audit: nil)
    # Create entity value.
    # Create a new value for an entity.
    #
    #   If you want to create multiple entity values with a single API call, consider
    #   using the **[Update entity](#update-entity)** method instead.
    # @param workspace_id [String] Unique identifier of the workspace.
    # @param entity [String] The name of the entity.
    # @param value [String] The text of the entity value. This string must conform to the following
    #   restrictions:
    #   - It cannot contain carriage return, newline, or tab characters.
    #   - It cannot consist of only whitespace characters.
    # @param metadata [Hash] Any metadata related to the entity value.
    # @param type [String] Specifies the type of entity value.
    # @param synonyms [Array[String]] An array of synonyms for the entity value. A value can specify either synonyms or
    #   patterns (depending on the value type), but not both. A synonym must conform to
    #   the following resrictions:
    #   - It cannot contain carriage return, newline, or tab characters.
    #   - It cannot consist of only whitespace characters.
    # @param patterns [Array[String]] An array of patterns for the entity value. A value can specify either synonyms or
    #   patterns (depending on the value type), but not both. A pattern is a regular
    #   expression; for more information about how to specify a pattern, see the
    #   [documentation](https://cloud.ibm.com/docs/assistant?topic=assistant-entities#entities-create-dictionary-based).
    # @param include_audit [Boolean] Whether to include the audit properties (`created` and `updated` timestamps) in
    #   the response.
    # @return [IBMCloudSdkCore::DetailedResponse] A `IBMCloudSdkCore::DetailedResponse` object representing the response.
    def create_value(workspace_id:, entity:, value:, metadata: nil, type: nil, synonyms: nil, patterns: nil, include_audit: nil)
      raise ArgumentError.new("workspace_id must be provided") if workspace_id.nil?

      raise ArgumentError.new("entity must be provided") if entity.nil?

      raise ArgumentError.new("version must be provided") if version.nil?

      raise ArgumentError.new("value must be provided") if value.nil?

      headers = {
      }
      sdk_headers = Common.new.get_sdk_headers("conversation", "V1", "create_value")
      headers.merge!(sdk_headers)

      params = {
        "version" => @version,
        "include_audit" => include_audit
      }

      data = {
        "value" => value,
        "metadata" => metadata,
        "type" => type,
        "synonyms" => synonyms,
        "patterns" => patterns
      }

      method_url = "/v1/workspaces/%s/entities/%s/values" % [ERB::Util.url_encode(workspace_id), ERB::Util.url_encode(entity)]

      response = request(
        method: "POST",
        url: method_url,
        headers: headers,
        params: params,
        json: data,
        accept_json: true
      )
      response
    end

    ##
    # @!method get_value(workspace_id:, entity:, value:, export: nil, include_audit: nil)
    # Get entity value.
    # Get information about an entity value.
    # @param workspace_id [String] Unique identifier of the workspace.
    # @param entity [String] The name of the entity.
    # @param value [String] The text of the entity value.
    # @param export [Boolean] Whether to include all element content in the returned data. If
    #   **export**=`false`, the returned data includes only information about the element
    #   itself. If **export**=`true`, all content, including subelements, is included.
    # @param include_audit [Boolean] Whether to include the audit properties (`created` and `updated` timestamps) in
    #   the response.
    # @return [IBMCloudSdkCore::DetailedResponse] A `IBMCloudSdkCore::DetailedResponse` object representing the response.
    def get_value(workspace_id:, entity:, value:, export: nil, include_audit: nil)
      raise ArgumentError.new("workspace_id must be provided") if workspace_id.nil?

      raise ArgumentError.new("entity must be provided") if entity.nil?

      raise ArgumentError.new("value must be provided") if value.nil?

      raise ArgumentError.new("version must be provided") if version.nil?

      headers = {
      }
      sdk_headers = Common.new.get_sdk_headers("conversation", "V1", "get_value")
      headers.merge!(sdk_headers)

      params = {
        "version" => @version,
        "export" => export,
        "include_audit" => include_audit
      }

      method_url = "/v1/workspaces/%s/entities/%s/values/%s" % [ERB::Util.url_encode(workspace_id), ERB::Util.url_encode(entity), ERB::Util.url_encode(value)]

      response = request(
        method: "GET",
        url: method_url,
        headers: headers,
        params: params,
        accept_json: true
      )
      response
    end

    ##
    # @!method update_value(workspace_id:, entity:, value:, new_value: nil, new_metadata: nil, new_type: nil, new_synonyms: nil, new_patterns: nil, append: nil, include_audit: nil)
    # Update entity value.
    # Update an existing entity value with new or modified data. You must provide
    #   component objects defining the content of the updated entity value.
    #
    #   If you want to update multiple entity values with a single API call, consider
    #   using the **[Update entity](#update-entity)** method instead.
    # @param workspace_id [String] Unique identifier of the workspace.
    # @param entity [String] The name of the entity.
    # @param value [String] The text of the entity value.
    # @param new_value [String] The text of the entity value. This string must conform to the following
    #   restrictions:
    #   - It cannot contain carriage return, newline, or tab characters.
    #   - It cannot consist of only whitespace characters.
    # @param new_metadata [Hash] Any metadata related to the entity value.
    # @param new_type [String] Specifies the type of entity value.
    # @param new_synonyms [Array[String]] An array of synonyms for the entity value. A value can specify either synonyms or
    #   patterns (depending on the value type), but not both. A synonym must conform to
    #   the following resrictions:
    #   - It cannot contain carriage return, newline, or tab characters.
    #   - It cannot consist of only whitespace characters.
    # @param new_patterns [Array[String]] An array of patterns for the entity value. A value can specify either synonyms or
    #   patterns (depending on the value type), but not both. A pattern is a regular
    #   expression; for more information about how to specify a pattern, see the
    #   [documentation](https://cloud.ibm.com/docs/assistant?topic=assistant-entities#entities-create-dictionary-based).
    # @param append [Boolean] Whether the new data is to be appended to the existing data in the entity value.
    #   If **append**=`false`, elements included in the new data completely replace the
    #   corresponding existing elements, including all subelements. For example, if the
    #   new data for the entity value includes **synonyms** and **append**=`false`, all
    #   existing synonyms for the entity value are discarded and replaced with the new
    #   synonyms.
    #
    #   If **append**=`true`, existing elements are preserved, and the new elements are
    #   added. If any elements in the new data collide with existing elements, the update
    #   request fails.
    # @param include_audit [Boolean] Whether to include the audit properties (`created` and `updated` timestamps) in
    #   the response.
    # @return [IBMCloudSdkCore::DetailedResponse] A `IBMCloudSdkCore::DetailedResponse` object representing the response.
    def update_value(workspace_id:, entity:, value:, new_value: nil, new_metadata: nil, new_type: nil, new_synonyms: nil, new_patterns: nil, append: nil, include_audit: nil)
      raise ArgumentError.new("workspace_id must be provided") if workspace_id.nil?

      raise ArgumentError.new("entity must be provided") if entity.nil?

      raise ArgumentError.new("value must be provided") if value.nil?

      raise ArgumentError.new("version must be provided") if version.nil?

      headers = {
      }
      sdk_headers = Common.new.get_sdk_headers("conversation", "V1", "update_value")
      headers.merge!(sdk_headers)

      params = {
        "version" => @version,
        "append" => append,
        "include_audit" => include_audit
      }

      data = {
        "value" => new_value,
        "metadata" => new_metadata,
        "type" => new_type,
        "synonyms" => new_synonyms,
        "patterns" => new_patterns
      }

      method_url = "/v1/workspaces/%s/entities/%s/values/%s" % [ERB::Util.url_encode(workspace_id), ERB::Util.url_encode(entity), ERB::Util.url_encode(value)]

      response = request(
        method: "POST",
        url: method_url,
        headers: headers,
        params: params,
        json: data,
        accept_json: true
      )
      response
    end

    ##
    # @!method delete_value(workspace_id:, entity:, value:)
    # Delete entity value.
    # Delete a value from an entity.
    # @param workspace_id [String] Unique identifier of the workspace.
    # @param entity [String] The name of the entity.
    # @param value [String] The text of the entity value.
    # @return [nil]
    def delete_value(workspace_id:, entity:, value:)
      raise ArgumentError.new("workspace_id must be provided") if workspace_id.nil?

      raise ArgumentError.new("entity must be provided") if entity.nil?

      raise ArgumentError.new("value must be provided") if value.nil?

      raise ArgumentError.new("version must be provided") if version.nil?

      headers = {
      }
      sdk_headers = Common.new.get_sdk_headers("conversation", "V1", "delete_value")
      headers.merge!(sdk_headers)

      params = {
        "version" => @version
      }

      method_url = "/v1/workspaces/%s/entities/%s/values/%s" % [ERB::Util.url_encode(workspace_id), ERB::Util.url_encode(entity), ERB::Util.url_encode(value)]

      request(
        method: "DELETE",
        url: method_url,
        headers: headers,
        params: params,
        accept_json: true
      )
      nil
    end
    #########################
    # Synonyms
    #########################

    ##
    # @!method list_synonyms(workspace_id:, entity:, value:, page_limit: nil, include_count: nil, sort: nil, cursor: nil, include_audit: nil)
    # List entity value synonyms.
    # List the synonyms for an entity value.
    # @param workspace_id [String] Unique identifier of the workspace.
    # @param entity [String] The name of the entity.
    # @param value [String] The text of the entity value.
    # @param page_limit [Fixnum] The number of records to return in each page of results.
    # @param include_count [Boolean] Whether to include information about the number of records that satisfy the
    #   request, regardless of the page limit. If this parameter is `true`, the
    #   `pagination` object in the response includes the `total` property.
    # @param sort [String] The attribute by which returned entity value synonyms will be sorted. To reverse
    #   the sort order, prefix the value with a minus sign (`-`).
    # @param cursor [String] A token identifying the page of results to retrieve.
    # @param include_audit [Boolean] Whether to include the audit properties (`created` and `updated` timestamps) in
    #   the response.
    # @return [IBMCloudSdkCore::DetailedResponse] A `IBMCloudSdkCore::DetailedResponse` object representing the response.
    def list_synonyms(workspace_id:, entity:, value:, page_limit: nil, include_count: nil, sort: nil, cursor: nil, include_audit: nil)
      raise ArgumentError.new("workspace_id must be provided") if workspace_id.nil?

      raise ArgumentError.new("entity must be provided") if entity.nil?

      raise ArgumentError.new("value must be provided") if value.nil?

      raise ArgumentError.new("version must be provided") if version.nil?

      headers = {
      }
      sdk_headers = Common.new.get_sdk_headers("conversation", "V1", "list_synonyms")
      headers.merge!(sdk_headers)

      params = {
        "version" => @version,
        "page_limit" => page_limit,
        "include_count" => include_count,
        "sort" => sort,
        "cursor" => cursor,
        "include_audit" => include_audit
      }

      method_url = "/v1/workspaces/%s/entities/%s/values/%s/synonyms" % [ERB::Util.url_encode(workspace_id), ERB::Util.url_encode(entity), ERB::Util.url_encode(value)]

      response = request(
        method: "GET",
        url: method_url,
        headers: headers,
        params: params,
        accept_json: true
      )
      response
    end

    ##
    # @!method create_synonym(workspace_id:, entity:, value:, synonym:, include_audit: nil)
    # Create entity value synonym.
    # Add a new synonym to an entity value.
    #
    #   If you want to create multiple synonyms with a single API call, consider using the
    #   **[Update entity](#update-entity)** or **[Update entity
    #   value](#update-entity-value)** method instead.
    # @param workspace_id [String] Unique identifier of the workspace.
    # @param entity [String] The name of the entity.
    # @param value [String] The text of the entity value.
    # @param synonym [String] The text of the synonym. This string must conform to the following restrictions:
    #   - It cannot contain carriage return, newline, or tab characters.
    #   - It cannot consist of only whitespace characters.
    # @param include_audit [Boolean] Whether to include the audit properties (`created` and `updated` timestamps) in
    #   the response.
    # @return [IBMCloudSdkCore::DetailedResponse] A `IBMCloudSdkCore::DetailedResponse` object representing the response.
    def create_synonym(workspace_id:, entity:, value:, synonym:, include_audit: nil)
      raise ArgumentError.new("workspace_id must be provided") if workspace_id.nil?

      raise ArgumentError.new("entity must be provided") if entity.nil?

      raise ArgumentError.new("value must be provided") if value.nil?

      raise ArgumentError.new("version must be provided") if version.nil?

      raise ArgumentError.new("synonym must be provided") if synonym.nil?

      headers = {
      }
      sdk_headers = Common.new.get_sdk_headers("conversation", "V1", "create_synonym")
      headers.merge!(sdk_headers)

      params = {
        "version" => @version,
        "include_audit" => include_audit
      }

      data = {
        "synonym" => synonym
      }

      method_url = "/v1/workspaces/%s/entities/%s/values/%s/synonyms" % [ERB::Util.url_encode(workspace_id), ERB::Util.url_encode(entity), ERB::Util.url_encode(value)]

      response = request(
        method: "POST",
        url: method_url,
        headers: headers,
        params: params,
        json: data,
        accept_json: true
      )
      response
    end

    ##
    # @!method get_synonym(workspace_id:, entity:, value:, synonym:, include_audit: nil)
    # Get entity value synonym.
    # Get information about a synonym of an entity value.
    # @param workspace_id [String] Unique identifier of the workspace.
    # @param entity [String] The name of the entity.
    # @param value [String] The text of the entity value.
    # @param synonym [String] The text of the synonym.
    # @param include_audit [Boolean] Whether to include the audit properties (`created` and `updated` timestamps) in
    #   the response.
    # @return [IBMCloudSdkCore::DetailedResponse] A `IBMCloudSdkCore::DetailedResponse` object representing the response.
    def get_synonym(workspace_id:, entity:, value:, synonym:, include_audit: nil)
      raise ArgumentError.new("workspace_id must be provided") if workspace_id.nil?

      raise ArgumentError.new("entity must be provided") if entity.nil?

      raise ArgumentError.new("value must be provided") if value.nil?

      raise ArgumentError.new("synonym must be provided") if synonym.nil?

      raise ArgumentError.new("version must be provided") if version.nil?

      headers = {
      }
      sdk_headers = Common.new.get_sdk_headers("conversation", "V1", "get_synonym")
      headers.merge!(sdk_headers)

      params = {
        "version" => @version,
        "include_audit" => include_audit
      }

      method_url = "/v1/workspaces/%s/entities/%s/values/%s/synonyms/%s" % [ERB::Util.url_encode(workspace_id), ERB::Util.url_encode(entity), ERB::Util.url_encode(value), ERB::Util.url_encode(synonym)]

      response = request(
        method: "GET",
        url: method_url,
        headers: headers,
        params: params,
        accept_json: true
      )
      response
    end

    ##
    # @!method update_synonym(workspace_id:, entity:, value:, synonym:, new_synonym: nil, include_audit: nil)
    # Update entity value synonym.
    # Update an existing entity value synonym with new text.
    #
    #   If you want to update multiple synonyms with a single API call, consider using the
    #   **[Update entity](#update-entity)** or **[Update entity
    #   value](#update-entity-value)** method instead.
    # @param workspace_id [String] Unique identifier of the workspace.
    # @param entity [String] The name of the entity.
    # @param value [String] The text of the entity value.
    # @param synonym [String] The text of the synonym.
    # @param new_synonym [String] The text of the synonym. This string must conform to the following restrictions:
    #   - It cannot contain carriage return, newline, or tab characters.
    #   - It cannot consist of only whitespace characters.
    # @param include_audit [Boolean] Whether to include the audit properties (`created` and `updated` timestamps) in
    #   the response.
    # @return [IBMCloudSdkCore::DetailedResponse] A `IBMCloudSdkCore::DetailedResponse` object representing the response.
    def update_synonym(workspace_id:, entity:, value:, synonym:, new_synonym: nil, include_audit: nil)
      raise ArgumentError.new("workspace_id must be provided") if workspace_id.nil?

      raise ArgumentError.new("entity must be provided") if entity.nil?

      raise ArgumentError.new("value must be provided") if value.nil?

      raise ArgumentError.new("synonym must be provided") if synonym.nil?

      raise ArgumentError.new("version must be provided") if version.nil?

      headers = {
      }
      sdk_headers = Common.new.get_sdk_headers("conversation", "V1", "update_synonym")
      headers.merge!(sdk_headers)

      params = {
        "version" => @version,
        "include_audit" => include_audit
      }

      data = {
        "synonym" => new_synonym
      }

      method_url = "/v1/workspaces/%s/entities/%s/values/%s/synonyms/%s" % [ERB::Util.url_encode(workspace_id), ERB::Util.url_encode(entity), ERB::Util.url_encode(value), ERB::Util.url_encode(synonym)]

      response = request(
        method: "POST",
        url: method_url,
        headers: headers,
        params: params,
        json: data,
        accept_json: true
      )
      response
    end

    ##
    # @!method delete_synonym(workspace_id:, entity:, value:, synonym:)
    # Delete entity value synonym.
    # Delete a synonym from an entity value.
    # @param workspace_id [String] Unique identifier of the workspace.
    # @param entity [String] The name of the entity.
    # @param value [String] The text of the entity value.
    # @param synonym [String] The text of the synonym.
    # @return [nil]
    def delete_synonym(workspace_id:, entity:, value:, synonym:)
      raise ArgumentError.new("workspace_id must be provided") if workspace_id.nil?

      raise ArgumentError.new("entity must be provided") if entity.nil?

      raise ArgumentError.new("value must be provided") if value.nil?

      raise ArgumentError.new("synonym must be provided") if synonym.nil?

      raise ArgumentError.new("version must be provided") if version.nil?

      headers = {
      }
      sdk_headers = Common.new.get_sdk_headers("conversation", "V1", "delete_synonym")
      headers.merge!(sdk_headers)

      params = {
        "version" => @version
      }

      method_url = "/v1/workspaces/%s/entities/%s/values/%s/synonyms/%s" % [ERB::Util.url_encode(workspace_id), ERB::Util.url_encode(entity), ERB::Util.url_encode(value), ERB::Util.url_encode(synonym)]

      request(
        method: "DELETE",
        url: method_url,
        headers: headers,
        params: params,
        accept_json: true
      )
      nil
    end
    #########################
    # Dialog nodes
    #########################

    ##
    # @!method list_dialog_nodes(workspace_id:, page_limit: nil, include_count: nil, sort: nil, cursor: nil, include_audit: nil)
    # List dialog nodes.
    # List the dialog nodes for a workspace.
    # @param workspace_id [String] Unique identifier of the workspace.
    # @param page_limit [Fixnum] The number of records to return in each page of results.
    # @param include_count [Boolean] Whether to include information about the number of records that satisfy the
    #   request, regardless of the page limit. If this parameter is `true`, the
    #   `pagination` object in the response includes the `total` property.
    # @param sort [String] The attribute by which returned dialog nodes will be sorted. To reverse the sort
    #   order, prefix the value with a minus sign (`-`).
    # @param cursor [String] A token identifying the page of results to retrieve.
    # @param include_audit [Boolean] Whether to include the audit properties (`created` and `updated` timestamps) in
    #   the response.
    # @return [IBMCloudSdkCore::DetailedResponse] A `IBMCloudSdkCore::DetailedResponse` object representing the response.
    def list_dialog_nodes(workspace_id:, page_limit: nil, include_count: nil, sort: nil, cursor: nil, include_audit: nil)
      raise ArgumentError.new("workspace_id must be provided") if workspace_id.nil?

      raise ArgumentError.new("version must be provided") if version.nil?

      headers = {
      }
      sdk_headers = Common.new.get_sdk_headers("conversation", "V1", "list_dialog_nodes")
      headers.merge!(sdk_headers)

      params = {
        "version" => @version,
        "page_limit" => page_limit,
        "include_count" => include_count,
        "sort" => sort,
        "cursor" => cursor,
        "include_audit" => include_audit
      }

      method_url = "/v1/workspaces/%s/dialog_nodes" % [ERB::Util.url_encode(workspace_id)]

      response = request(
        method: "GET",
        url: method_url,
        headers: headers,
        params: params,
        accept_json: true
      )
      response
    end

    ##
    # @!method create_dialog_node(workspace_id:, dialog_node:, description: nil, conditions: nil, parent: nil, previous_sibling: nil, output: nil, context: nil, metadata: nil, next_step: nil, title: nil, type: nil, event_name: nil, variable: nil, actions: nil, digress_in: nil, digress_out: nil, digress_out_slots: nil, user_label: nil, disambiguation_opt_out: nil, include_audit: nil)
    # Create dialog node.
    # Create a new dialog node.
    #
    #   If you want to create multiple dialog nodes with a single API call, consider using
    #   the **[Update workspace](#update-workspace)** method instead.
    # @param workspace_id [String] Unique identifier of the workspace.
    # @param dialog_node [String] The dialog node ID. This string must conform to the following restrictions:
    #   - It can contain only Unicode alphanumeric, space, underscore, hyphen, and dot
    #   characters.
    # @param description [String] The description of the dialog node. This string cannot contain carriage return,
    #   newline, or tab characters.
    # @param conditions [String] The condition that will trigger the dialog node. This string cannot contain
    #   carriage return, newline, or tab characters.
    # @param parent [String] The ID of the parent dialog node. This property is omitted if the dialog node has
    #   no parent.
    # @param previous_sibling [String] The ID of the previous sibling dialog node. This property is omitted if the dialog
    #   node has no previous sibling.
    # @param output [DialogNodeOutput] The output of the dialog node. For more information about how to specify dialog
    #   node output, see the
    #   [documentation](https://cloud.ibm.com/docs/assistant?topic=assistant-dialog-overview#dialog-overview-responses).
    # @param context [DialogNodeContext] The context for the dialog node.
    # @param metadata [Hash] The metadata for the dialog node.
    # @param next_step [DialogNodeNextStep] The next step to execute following this dialog node.
    # @param title [String] The alias used to identify the dialog node. This string must conform to the
    #   following restrictions:
    #   - It can contain only Unicode alphanumeric, space, underscore, hyphen, and dot
    #   characters.
    # @param type [String] How the dialog node is processed.
    # @param event_name [String] How an `event_handler` node is processed.
    # @param variable [String] The location in the dialog context where output is stored.
    # @param actions [Array[DialogNodeAction]] An array of objects describing any actions to be invoked by the dialog node.
    # @param digress_in [String] Whether this top-level dialog node can be digressed into.
    # @param digress_out [String] Whether this dialog node can be returned to after a digression.
    # @param digress_out_slots [String] Whether the user can digress to top-level nodes while filling out slots.
    # @param user_label [String] A label that can be displayed externally to describe the purpose of the node to
    #   users.
    # @param disambiguation_opt_out [Boolean] Whether the dialog node should be excluded from disambiguation suggestions. Valid
    #   only when **type**=`standard` or `frame`.
    # @param include_audit [Boolean] Whether to include the audit properties (`created` and `updated` timestamps) in
    #   the response.
    # @return [IBMCloudSdkCore::DetailedResponse] A `IBMCloudSdkCore::DetailedResponse` object representing the response.
    def create_dialog_node(workspace_id:, dialog_node:, description: nil, conditions: nil, parent: nil, previous_sibling: nil, output: nil, context: nil, metadata: nil, next_step: nil, title: nil, type: nil, event_name: nil, variable: nil, actions: nil, digress_in: nil, digress_out: nil, digress_out_slots: nil, user_label: nil, disambiguation_opt_out: nil, include_audit: nil)
      raise ArgumentError.new("workspace_id must be provided") if workspace_id.nil?

      raise ArgumentError.new("version must be provided") if version.nil?

      raise ArgumentError.new("dialog_node must be provided") if dialog_node.nil?

      headers = {
      }
      sdk_headers = Common.new.get_sdk_headers("conversation", "V1", "create_dialog_node")
      headers.merge!(sdk_headers)

      params = {
        "version" => @version,
        "include_audit" => include_audit
      }

      data = {
        "dialog_node" => dialog_node,
        "description" => description,
        "conditions" => conditions,
        "parent" => parent,
        "previous_sibling" => previous_sibling,
        "output" => output,
        "context" => context,
        "metadata" => metadata,
        "next_step" => next_step,
        "title" => title,
        "type" => type,
        "event_name" => event_name,
        "variable" => variable,
        "actions" => actions,
        "digress_in" => digress_in,
        "digress_out" => digress_out,
        "digress_out_slots" => digress_out_slots,
        "user_label" => user_label,
        "disambiguation_opt_out" => disambiguation_opt_out
      }

      method_url = "/v1/workspaces/%s/dialog_nodes" % [ERB::Util.url_encode(workspace_id)]

      response = request(
        method: "POST",
        url: method_url,
        headers: headers,
        params: params,
        json: data,
        accept_json: true
      )
      response
    end

    ##
    # @!method get_dialog_node(workspace_id:, dialog_node:, include_audit: nil)
    # Get dialog node.
    # Get information about a dialog node.
    # @param workspace_id [String] Unique identifier of the workspace.
    # @param dialog_node [String] The dialog node ID (for example, `get_order`).
    # @param include_audit [Boolean] Whether to include the audit properties (`created` and `updated` timestamps) in
    #   the response.
    # @return [IBMCloudSdkCore::DetailedResponse] A `IBMCloudSdkCore::DetailedResponse` object representing the response.
    def get_dialog_node(workspace_id:, dialog_node:, include_audit: nil)
      raise ArgumentError.new("workspace_id must be provided") if workspace_id.nil?

      raise ArgumentError.new("dialog_node must be provided") if dialog_node.nil?

      raise ArgumentError.new("version must be provided") if version.nil?

      headers = {
      }
      sdk_headers = Common.new.get_sdk_headers("conversation", "V1", "get_dialog_node")
      headers.merge!(sdk_headers)

      params = {
        "version" => @version,
        "include_audit" => include_audit
      }

      method_url = "/v1/workspaces/%s/dialog_nodes/%s" % [ERB::Util.url_encode(workspace_id), ERB::Util.url_encode(dialog_node)]

      response = request(
        method: "GET",
        url: method_url,
        headers: headers,
        params: params,
        accept_json: true
      )
      response
    end

    ##
    # @!method update_dialog_node(workspace_id:, dialog_node:, new_dialog_node: nil, new_description: nil, new_conditions: nil, new_parent: nil, new_previous_sibling: nil, new_output: nil, new_context: nil, new_metadata: nil, new_next_step: nil, new_title: nil, new_type: nil, new_event_name: nil, new_variable: nil, new_actions: nil, new_digress_in: nil, new_digress_out: nil, new_digress_out_slots: nil, new_user_label: nil, new_disambiguation_opt_out: nil, include_audit: nil)
    # Update dialog node.
    # Update an existing dialog node with new or modified data.
    #
    #   If you want to update multiple dialog nodes with a single API call, consider using
    #   the **[Update workspace](#update-workspace)** method instead.
    # @param workspace_id [String] Unique identifier of the workspace.
    # @param dialog_node [String] The dialog node ID (for example, `get_order`).
    # @param new_dialog_node [String] The dialog node ID. This string must conform to the following restrictions:
    #   - It can contain only Unicode alphanumeric, space, underscore, hyphen, and dot
    #   characters.
    # @param new_description [String] The description of the dialog node. This string cannot contain carriage return,
    #   newline, or tab characters.
    # @param new_conditions [String] The condition that will trigger the dialog node. This string cannot contain
    #   carriage return, newline, or tab characters.
    # @param new_parent [String] The ID of the parent dialog node. This property is omitted if the dialog node has
    #   no parent.
    # @param new_previous_sibling [String] The ID of the previous sibling dialog node. This property is omitted if the dialog
    #   node has no previous sibling.
    # @param new_output [DialogNodeOutput] The output of the dialog node. For more information about how to specify dialog
    #   node output, see the
    #   [documentation](https://cloud.ibm.com/docs/assistant?topic=assistant-dialog-overview#dialog-overview-responses).
    # @param new_context [DialogNodeContext] The context for the dialog node.
    # @param new_metadata [Hash] The metadata for the dialog node.
    # @param new_next_step [DialogNodeNextStep] The next step to execute following this dialog node.
    # @param new_title [String] The alias used to identify the dialog node. This string must conform to the
    #   following restrictions:
    #   - It can contain only Unicode alphanumeric, space, underscore, hyphen, and dot
    #   characters.
    # @param new_type [String] How the dialog node is processed.
    # @param new_event_name [String] How an `event_handler` node is processed.
    # @param new_variable [String] The location in the dialog context where output is stored.
    # @param new_actions [Array[DialogNodeAction]] An array of objects describing any actions to be invoked by the dialog node.
    # @param new_digress_in [String] Whether this top-level dialog node can be digressed into.
    # @param new_digress_out [String] Whether this dialog node can be returned to after a digression.
    # @param new_digress_out_slots [String] Whether the user can digress to top-level nodes while filling out slots.
    # @param new_user_label [String] A label that can be displayed externally to describe the purpose of the node to
    #   users.
    # @param new_disambiguation_opt_out [Boolean] Whether the dialog node should be excluded from disambiguation suggestions. Valid
    #   only when **type**=`standard` or `frame`.
    # @param include_audit [Boolean] Whether to include the audit properties (`created` and `updated` timestamps) in
    #   the response.
    # @return [IBMCloudSdkCore::DetailedResponse] A `IBMCloudSdkCore::DetailedResponse` object representing the response.
    def update_dialog_node(workspace_id:, dialog_node:, new_dialog_node: nil, new_description: nil, new_conditions: nil, new_parent: nil, new_previous_sibling: nil, new_output: nil, new_context: nil, new_metadata: nil, new_next_step: nil, new_title: nil, new_type: nil, new_event_name: nil, new_variable: nil, new_actions: nil, new_digress_in: nil, new_digress_out: nil, new_digress_out_slots: nil, new_user_label: nil, new_disambiguation_opt_out: nil, include_audit: nil)
      raise ArgumentError.new("workspace_id must be provided") if workspace_id.nil?

      raise ArgumentError.new("dialog_node must be provided") if dialog_node.nil?

      raise ArgumentError.new("version must be provided") if version.nil?

      headers = {
      }
      sdk_headers = Common.new.get_sdk_headers("conversation", "V1", "update_dialog_node")
      headers.merge!(sdk_headers)

      params = {
        "version" => @version,
        "include_audit" => include_audit
      }

      data = {
        "dialog_node" => new_dialog_node,
        "description" => new_description,
        "conditions" => new_conditions,
        "parent" => new_parent,
        "previous_sibling" => new_previous_sibling,
        "output" => new_output,
        "context" => new_context,
        "metadata" => new_metadata,
        "next_step" => new_next_step,
        "title" => new_title,
        "type" => new_type,
        "event_name" => new_event_name,
        "variable" => new_variable,
        "actions" => new_actions,
        "digress_in" => new_digress_in,
        "digress_out" => new_digress_out,
        "digress_out_slots" => new_digress_out_slots,
        "user_label" => new_user_label,
        "disambiguation_opt_out" => new_disambiguation_opt_out
      }

      method_url = "/v1/workspaces/%s/dialog_nodes/%s" % [ERB::Util.url_encode(workspace_id), ERB::Util.url_encode(dialog_node)]

      response = request(
        method: "POST",
        url: method_url,
        headers: headers,
        params: params,
        json: data,
        accept_json: true
      )
      response
    end

    ##
    # @!method delete_dialog_node(workspace_id:, dialog_node:)
    # Delete dialog node.
    # Delete a dialog node from a workspace.
    # @param workspace_id [String] Unique identifier of the workspace.
    # @param dialog_node [String] The dialog node ID (for example, `get_order`).
    # @return [nil]
    def delete_dialog_node(workspace_id:, dialog_node:)
      raise ArgumentError.new("workspace_id must be provided") if workspace_id.nil?

      raise ArgumentError.new("dialog_node must be provided") if dialog_node.nil?

      raise ArgumentError.new("version must be provided") if version.nil?

      headers = {
      }
      sdk_headers = Common.new.get_sdk_headers("conversation", "V1", "delete_dialog_node")
      headers.merge!(sdk_headers)

      params = {
        "version" => @version
      }

      method_url = "/v1/workspaces/%s/dialog_nodes/%s" % [ERB::Util.url_encode(workspace_id), ERB::Util.url_encode(dialog_node)]

      request(
        method: "DELETE",
        url: method_url,
        headers: headers,
        params: params,
        accept_json: true
      )
      nil
    end
    #########################
    # Logs
    #########################

    ##
    # @!method list_logs(workspace_id:, sort: nil, filter: nil, page_limit: nil, cursor: nil)
    # List log events in a workspace.
    # List the events from the log of a specific workspace.
    # @param workspace_id [String] Unique identifier of the workspace.
    # @param sort [String] How to sort the returned log events. You can sort by **request_timestamp**. To
    #   reverse the sort order, prefix the parameter value with a minus sign (`-`).
    # @param filter [String] A cacheable parameter that limits the results to those matching the specified
    #   filter. For more information, see the
    #   [documentation](https://cloud.ibm.com/docs/assistant?topic=assistant-filter-reference#filter-reference).
    # @param page_limit [Fixnum] The number of records to return in each page of results.
    # @param cursor [String] A token identifying the page of results to retrieve.
    # @return [IBMCloudSdkCore::DetailedResponse] A `IBMCloudSdkCore::DetailedResponse` object representing the response.
    def list_logs(workspace_id:, sort: nil, filter: nil, page_limit: nil, cursor: nil)
      raise ArgumentError.new("workspace_id must be provided") if workspace_id.nil?

      raise ArgumentError.new("version must be provided") if version.nil?

      headers = {
      }
      sdk_headers = Common.new.get_sdk_headers("conversation", "V1", "list_logs")
      headers.merge!(sdk_headers)

      params = {
        "version" => @version,
        "sort" => sort,
        "filter" => filter,
        "page_limit" => page_limit,
        "cursor" => cursor
      }

      method_url = "/v1/workspaces/%s/logs" % [ERB::Util.url_encode(workspace_id)]

      response = request(
        method: "GET",
        url: method_url,
        headers: headers,
        params: params,
        accept_json: true
      )
      response
    end

    ##
    # @!method list_all_logs(filter:, sort: nil, page_limit: nil, cursor: nil)
    # List log events in all workspaces.
    # List the events from the logs of all workspaces in the service instance.
    # @param filter [String] A cacheable parameter that limits the results to those matching the specified
    #   filter. You must specify a filter query that includes a value for `language`, as
    #   well as a value for `request.context.system.assistant_id`, `workspace_id`, or
    #   `request.context.metadata.deployment`. For more information, see the
    #   [documentation](https://cloud.ibm.com/docs/assistant?topic=assistant-filter-reference#filter-reference).
    # @param sort [String] How to sort the returned log events. You can sort by **request_timestamp**. To
    #   reverse the sort order, prefix the parameter value with a minus sign (`-`).
    # @param page_limit [Fixnum] The number of records to return in each page of results.
    # @param cursor [String] A token identifying the page of results to retrieve.
    # @return [IBMCloudSdkCore::DetailedResponse] A `IBMCloudSdkCore::DetailedResponse` object representing the response.
    def list_all_logs(filter:, sort: nil, page_limit: nil, cursor: nil)
      raise ArgumentError.new("version must be provided") if version.nil?

      raise ArgumentError.new("filter must be provided") if filter.nil?

      headers = {
      }
      sdk_headers = Common.new.get_sdk_headers("conversation", "V1", "list_all_logs")
      headers.merge!(sdk_headers)

      params = {
        "version" => @version,
        "filter" => filter,
        "sort" => sort,
        "page_limit" => page_limit,
        "cursor" => cursor
      }

      method_url = "/v1/logs"

      response = request(
        method: "GET",
        url: method_url,
        headers: headers,
        params: params,
        accept_json: true
      )
      response
    end
    #########################
    # User data
    #########################

    ##
    # @!method delete_user_data(customer_id:)
    # Delete labeled data.
    # Deletes all data associated with a specified customer ID. The method has no effect
    #   if no data is associated with the customer ID.
    #
    #   You associate a customer ID with data by passing the `X-Watson-Metadata` header
    #   with a request that passes data. For more information about personal data and
    #   customer IDs, see [Information
    #   security](https://cloud.ibm.com/docs/assistant?topic=assistant-information-security#information-security).
    # @param customer_id [String] The customer ID for which all data is to be deleted.
    # @return [nil]
    def delete_user_data(customer_id:)
      raise ArgumentError.new("version must be provided") if version.nil?

      raise ArgumentError.new("customer_id must be provided") if customer_id.nil?

      headers = {
      }
      sdk_headers = Common.new.get_sdk_headers("conversation", "V1", "delete_user_data")
      headers.merge!(sdk_headers)

      params = {
        "version" => @version,
        "customer_id" => customer_id
      }

      method_url = "/v1/user_data"

      request(
        method: "DELETE",
        url: method_url,
        headers: headers,
        params: params,
        accept_json: true
      )
      nil
    end
    #########################
    # bulkClassify
    #########################

    ##
    # @!method bulk_classify(workspace_id:, input: nil)
    # Identify intents and entities in multiple user utterances.
    # Send multiple user inputs to a workspace in a single request and receive
    #   information about the intents and entities recognized in each input. This method
    #   is useful for testing and comparing the performance of different workspaces.
    #
    #   This method is available only with Premium plans.
    # @param workspace_id [String] Unique identifier of the workspace.
    # @param input [Array[BulkClassifyUtterance]] An array of input utterances to classify.
    # @return [IBMCloudSdkCore::DetailedResponse] A `IBMCloudSdkCore::DetailedResponse` object representing the response.
    def bulk_classify(workspace_id:, input: nil)
      raise ArgumentError.new("workspace_id must be provided") if workspace_id.nil?

      raise ArgumentError.new("version must be provided") if version.nil?

      headers = {
      }
      sdk_headers = Common.new.get_sdk_headers("conversation", "V1", "bulk_classify")
      headers.merge!(sdk_headers)

      params = {
        "version" => @version
      }

      data = {
        "input" => input
      }

      method_url = "/v1/workspaces/%s/bulk_classify" % [ERB::Util.url_encode(workspace_id)]

      response = request(
        method: "POST",
        url: method_url,
        headers: headers,
        params: params,
        json: data,
        accept_json: true
      )
      response
    end
  end
end
