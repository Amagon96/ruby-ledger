# frozen_string_literal: true

require 'thor'
require_relative 'parser'

class Ledger < Thor
  desc 'hello NAME', 'say hello to NAME'
  option :from
  def hello(name)
    puts "from: #{options[:from]}" if options[:from]
    puts "Hello #{name}"
  end

  desc "register", "The register command displays all the postings occurring in a single account, line by line."
  def register
    puts "register command"
  end

  desc "balance", "The balance command reports the current balance of all accounts. "
  def balance
    parser = Parser.new
    accounts = parser.parserAccounts("index.ledger")

    puts accounts
  end

  desc "print", "The print command prints out ledger transactions in a textual format that can be parsed by Ledger."
  def print
    puts "print command"
  end
end

Ledger.start(ARGV)
