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
# The IBM Watson&trade; Tone Analyzer service uses linguistic analysis to detect
# emotional and language tones in written text. The service can analyze tone at both the
# document and sentence levels. You can use the service to understand how your written
# communications are perceived and then to improve the tone of your communications.
# Businesses can use the service to learn the tone of their customers' communications and
# to respond to each customer appropriately, or to understand and improve their customer
# conversations.
#
# **Note:** Request logging is disabled for the Tone Analyzer service. Regardless of
# whether you set the `X-Watson-Learning-Opt-Out` request header, the service does not log
# or retain data from requests and responses.

require "concurrent"
require "erb"
require "json"
require "ibm_cloud_sdk_core"
require_relative "./common.rb"

# Module for the Watson APIs
module IBMWatson
  ##
  # The Tone Analyzer V3 service.
  class ToneAnalyzerV3 < IBMCloudSdkCore::BaseService
    include Concurrent::Async
    DEFAULT_SERVICE_NAME = "tone_analyzer"
    DEFAULT_SERVICE_URL = "https://api.us-south.tone-analyzer.watson.cloud.ibm.com"
    attr_accessor :version
    ##
    # @!method initialize(args)
    # Construct a new client for the Tone Analyzer service.
    #
    # @param args [Hash] The args to initialize with
    # @option args version [String] Release date of the version of the API you want to use. Specify dates in
    #   YYYY-MM-DD format. The current version is `2017-09-21`.
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
    # Methods
    #########################

    ##
    # @!method tone(tone_input:, content_type: nil, sentences: nil, tones: nil, content_language: nil, accept_language: nil)
    # Analyze general tone.
    # Use the general-purpose endpoint to analyze the tone of your input content. The
    #   service analyzes the content for emotional and language tones. The method always
    #   analyzes the tone of the full document; by default, it also analyzes the tone of
    #   each individual sentence of the content.
    #
    #   You can submit no more than 128 KB of total input content and no more than 1000
    #   individual sentences in JSON, plain text, or HTML format. The service analyzes the
    #   first 1000 sentences for document-level analysis and only the first 100 sentences
    #   for sentence-level analysis.
    #
    #   Per the JSON specification, the default character encoding for JSON content is
    #   effectively always UTF-8; per the HTTP specification, the default encoding for
    #   plain text and HTML is ISO-8859-1 (effectively, the ASCII character set). When
    #   specifying a content type of plain text or HTML, include the `charset` parameter
    #   to indicate the character encoding of the input text; for example: `Content-Type:
    #   text/plain;charset=utf-8`. For `text/html`, the service removes HTML tags and
    #   analyzes only the textual content.
    #
    #   **See also:** [Using the general-purpose
    #   endpoint](https://cloud.ibm.com/docs/tone-analyzer?topic=tone-analyzer-utgpe#utgpe).
    # @param tone_input [ToneInput] JSON, plain text, or HTML input that contains the content to be analyzed. For JSON
    #   input, provide an object of type `ToneInput`.
    # @param content_type [String] The type of the input. A character encoding can be specified by including a
    #   `charset` parameter. For example, 'text/plain;charset=utf-8'.
    # @param sentences [Boolean] Indicates whether the service is to return an analysis of each individual sentence
    #   in addition to its analysis of the full document. If `true` (the default), the
    #   service returns results for each sentence.
    # @param tones [Array[String]] **`2017-09-21`:** Deprecated. The service continues to accept the parameter for
    #   backward-compatibility, but the parameter no longer affects the response.
    #
    #   **`2016-05-19`:** A comma-separated list of tones for which the service is to
    #   return its analysis of the input; the indicated tones apply both to the full
    #   document and to individual sentences of the document. You can specify one or more
    #   of the valid values. Omit the parameter to request results for all three tones.
    # @param content_language [String] The language of the input text for the request: English or French. Regional
    #   variants are treated as their parent language; for example, `en-US` is interpreted
    #   as `en`. The input content must match the specified language. Do not submit
    #   content that contains both languages. You can use different languages for
    #   **Content-Language** and **Accept-Language**.
    #   * **`2017-09-21`:** Accepts `en` or `fr`.
    #   * **`2016-05-19`:** Accepts only `en`.
    # @param accept_language [String] The desired language of the response. For two-character arguments, regional
    #   variants are treated as their parent language; for example, `en-US` is interpreted
    #   as `en`. You can use different languages for **Content-Language** and
    #   **Accept-Language**.
    # @return [IBMCloudSdkCore::DetailedResponse] A `IBMCloudSdkCore::DetailedResponse` object representing the response.
    def tone(tone_input:, content_type: nil, sentences: nil, tones: nil, content_language: nil, accept_language: nil)
      raise ArgumentError.new("version must be provided") if version.nil?

      raise ArgumentError.new("tone_input must be provided") if tone_input.nil?

      headers = {
        "Content-Type" => content_type,
        "Content-Language" => content_language,
        "Accept-Language" => accept_language
      }
      sdk_headers = Common.new.get_sdk_headers("tone_analyzer", "V3", "tone")
      headers.merge!(sdk_headers)
      tones *= "," unless tones.nil?

      params = {
        "version" => @version,
        "sentences" => sentences,
        "tones" => tones
      }

      if content_type.start_with?("application/json") && tone_input.instance_of?(Hash)
        data = tone_input.to_json
      else
        data = tone_input
      end

      method_url = "/v3/tone"

      response = request(
        method: "POST",
        url: method_url,
        headers: headers,
        params: params,
        data: data,
        accept_json: true
      )
      response
    end

    ##
    # @!method tone_chat(utterances:, content_language: nil, accept_language: nil)
    # Analyze customer-engagement tone.
    # Use the customer-engagement endpoint to analyze the tone of customer service and
    #   customer support conversations. For each utterance of a conversation, the method
    #   reports the most prevalent subset of the following seven tones: sad, frustrated,
    #   satisfied, excited, polite, impolite, and sympathetic.
    #
    #   If you submit more than 50 utterances, the service returns a warning for the
    #   overall content and analyzes only the first 50 utterances. If you submit a single
    #   utterance that contains more than 500 characters, the service returns an error for
    #   that utterance and does not analyze the utterance. The request fails if all
    #   utterances have more than 500 characters. Per the JSON specification, the default
    #   character encoding for JSON content is effectively always UTF-8.
    #
    #   **See also:** [Using the customer-engagement
    #   endpoint](https://cloud.ibm.com/docs/tone-analyzer?topic=tone-analyzer-utco#utco).
    # @param utterances [Array[Utterance]] An array of `Utterance` objects that provides the input content that the service
    #   is to analyze.
    # @param content_language [String] The language of the input text for the request: English or French. Regional
    #   variants are treated as their parent language; for example, `en-US` is interpreted
    #   as `en`. The input content must match the specified language. Do not submit
    #   content that contains both languages. You can use different languages for
    #   **Content-Language** and **Accept-Language**.
    #   * **`2017-09-21`:** Accepts `en` or `fr`.
    #   * **`2016-05-19`:** Accepts only `en`.
    # @param accept_language [String] The desired language of the response. For two-character arguments, regional
    #   variants are treated as their parent language; for example, `en-US` is interpreted
    #   as `en`. You can use different languages for **Content-Language** and
    #   **Accept-Language**.
    # @return [IBMCloudSdkCore::DetailedResponse] A `IBMCloudSdkCore::DetailedResponse` object representing the response.
    def tone_chat(utterances:, content_language: nil, accept_language: nil)
      raise ArgumentError.new("version must be provided") if version.nil?

      raise ArgumentError.new("utterances must be provided") if utterances.nil?

      headers = {
        "Content-Language" => content_language,
        "Accept-Language" => accept_language
      }
      sdk_headers = Common.new.get_sdk_headers("tone_analyzer", "V3", "tone_chat")
      headers.merge!(sdk_headers)

      params = {
        "version" => @version
      }

      data = {
        "utterances" => utterances
      }

      method_url = "/v3/tone_chat"

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
