# frozen_string_literal: true
require_relative 'Transaction'
class Parser
  TRANSACTION_RGX = /\d{4}\/\d{1,2}\/\d{1,2} .+/.freeze
  TRANSACTION_DATE_RGX = /\d{4}\/\d{1,2}\/\d{1,2}/.freeze
  TRANSACTION_DESC_RGX = /[^\d{4}\/\d{1,2}\/\d{1,2}]+/.freeze
  ACCOUNT_DESC_RGX = /[^\-?\$?\d+\.?\d+$]+/.freeze
  ACCOUNT_ACTION_RGX = /\-?\$?\d+\.?\d?.+/.freeze
  ACCOUNT_AMOUNT_RGX = /[\-.|\d]/.freeze
  ACCOUNT_CURRENCY_RGX = /[a-zA-z\$]+/.freeze
  COMMENT_RGX = /[\;#%|*].+/.freeze
  INCLUDE_RGX = /!include .+/.freeze
  LEDGER_FILE_RGX = %r{[\w/]+\.ledger$}.freeze
  FILEPATH = "sample-files/"

  def initialize
    @parsed_file = []
  end

  def parserAccounts(fileName)
    File.open(filePath = "#{FILEPATH}#{fileName}").each_with_index do |line, index|
      next if COMMENT_RGX.match(line)

      if line.start_with?('!include')
        new_file_path = line[LEDGER_FILE_RGX]
        @parsed_file |= parserAccounts(new_file_path)
      end
    end
    @parsed_file
  end

end