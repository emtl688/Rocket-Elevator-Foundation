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
# Analyze various features of text content at scale. Provide text, raw HTML, or a public
# URL and IBM Watson Natural Language Understanding will give you results for the features
# you request. The service cleans HTML content before analysis by default, so the results
# can ignore most advertisements and other unwanted content.
#
# You can create [custom
# models](https://cloud.ibm.com/docs/natural-language-understanding?topic=natural-language-understanding-customizing)
# with Watson Knowledge Studio to detect custom entities and relations in Natural Language
# Understanding.

require "concurrent"
require "erb"
require "json"
require "ibm_cloud_sdk_core"
require_relative "./common.rb"

# Module for the Watson APIs
module IBMWatson
  ##
  # The Natural Language Understanding V1 service.
  class NaturalLanguageUnderstandingV1 < IBMCloudSdkCore::BaseService
    include Concurrent::Async
    DEFAULT_SERVICE_NAME = "natural_language_understanding"
    DEFAULT_SERVICE_URL = "https://api.us-south.natural-language-understanding.watson.cloud.ibm.com"
    attr_accessor :version
    ##
    # @!method initialize(args)
    # Construct a new client for the Natural Language Understanding service.
    #
    # @param args [Hash] The args to initialize with
    # @option args version [String] Release date of the API version you want to use. Specify dates in YYYY-MM-DD
    #   format. The current version is `2020-08-01`.
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
    # Analyze
    #########################

    ##
    # @!method analyze(features:, text: nil, html: nil, url: nil, clean: nil, xpath: nil, fallback_to_raw: nil, return_analyzed_text: nil, language: nil, limit_text_characters: nil)
    # Analyze text.
    # Analyzes text, HTML, or a public webpage for the following features:
    #   - Categories
    #   - Concepts
    #   - Emotion
    #   - Entities
    #   - Keywords
    #   - Metadata
    #   - Relations
    #   - Semantic roles
    #   - Sentiment
    #   - Syntax
    #   - Summarization (Experimental)
    #
    #   If a language for the input text is not specified with the `language` parameter,
    #   the service [automatically detects the
    #   language](https://cloud.ibm.com/docs/natural-language-understanding?topic=natural-language-understanding-detectable-languages).
    # @param features [Features] Specific features to analyze the document for.
    # @param text [String] The plain text to analyze. One of the `text`, `html`, or `url` parameters is
    #   required.
    # @param html [String] The HTML file to analyze. One of the `text`, `html`, or `url` parameters is
    #   required.
    # @param url [String] The webpage to analyze. One of the `text`, `html`, or `url` parameters is
    #   required.
    # @param clean [Boolean] Set this to `false` to disable webpage cleaning. For more information about
    #   webpage cleaning, see [Analyzing
    #   webpages](https://cloud.ibm.com/docs/natural-language-understanding?topic=natural-language-understanding-analyzing-webpages).
    # @param xpath [String] An [XPath
    #   query](https://cloud.ibm.com/docs/natural-language-understanding?topic=natural-language-understanding-analyzing-webpages#xpath)
    #   to perform on `html` or `url` input. Results of the query will be appended to the
    #   cleaned webpage text before it is analyzed. To analyze only the results of the
    #   XPath query, set the `clean` parameter to `false`.
    # @param fallback_to_raw [Boolean] Whether to use raw HTML content if text cleaning fails.
    # @param return_analyzed_text [Boolean] Whether or not to return the analyzed text.
    # @param language [String] ISO 639-1 code that specifies the language of your text. This overrides automatic
    #   language detection. Language support differs depending on the features you include
    #   in your analysis. For more information, see [Language
    #   support](https://cloud.ibm.com/docs/natural-language-understanding?topic=natural-language-understanding-language-support).
    # @param limit_text_characters [Fixnum] Sets the maximum number of characters that are processed by the service.
    # @return [IBMCloudSdkCore::DetailedResponse] A `IBMCloudSdkCore::DetailedResponse` object representing the response.
    def analyze(features:, text: nil, html: nil, url: nil, clean: nil, xpath: nil, fallback_to_raw: nil, return_analyzed_text: nil, language: nil, limit_text_characters: nil)
      raise ArgumentError.new("version must be provided") if version.nil?

      raise ArgumentError.new("features must be provided") if features.nil?

      headers = {
      }
      sdk_headers = Common.new.get_sdk_headers("natural-language-understanding", "V1", "analyze")
      headers.merge!(sdk_headers)

      params = {
        "version" => @version
      }

      data = {
        "features" => features,
        "text" => text,
        "html" => html,
        "url" => url,
        "clean" => clean,
        "xpath" => xpath,
        "fallback_to_raw" => fallback_to_raw,
        "return_analyzed_text" => return_analyzed_text,
        "language" => language,
        "limit_text_characters" => limit_text_characters
      }

      method_url = "/v1/analyze"

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
    # Manage models
    #########################

    ##
    # @!method list_models
    # List models.
    # Lists Watson Knowledge Studio [custom entities and relations
    #   models](https://cloud.ibm.com/docs/natural-language-understanding?topic=natural-language-understanding-customizing)
    #   that are deployed to your Natural Language Understanding service.
    # @return [IBMCloudSdkCore::DetailedResponse] A `IBMCloudSdkCore::DetailedResponse` object representing the response.
    def list_models
      raise ArgumentError.new("version must be provided") if version.nil?

      headers = {
      }
      sdk_headers = Common.new.get_sdk_headers("natural-language-understanding", "V1", "list_models")
      headers.merge!(sdk_headers)

      params = {
        "version" => @version
      }

      method_url = "/v1/models"

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
    # @!method delete_model(model_id:)
    # Delete model.
    # Deletes a custom model.
    # @param model_id [String] Model ID of the model to delete.
    # @return [IBMCloudSdkCore::DetailedResponse] A `IBMCloudSdkCore::DetailedResponse` object representing the response.
    def delete_model(model_id:)
      raise ArgumentError.new("version must be provided") if version.nil?

      raise ArgumentError.new("model_id must be provided") if model_id.nil?

      headers = {
      }
      sdk_headers = Common.new.get_sdk_headers("natural-language-understanding", "V1", "delete_model")
      headers.merge!(sdk_headers)

      params = {
        "version" => @version
      }

      method_url = "/v1/models/%s" % [ERB::Util.url_encode(model_id)]

      response = request(
        method: "DELETE",
        url: method_url,
        headers: headers,
        params: params,
        accept_json: true
      )
      response
    end
  end
end
