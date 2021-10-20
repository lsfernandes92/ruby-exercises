require 'spec_helper'
require_relative '../string_dictionary'

RSpec.describe StringDictionary do
  subject { described_class.new(sentence, dictionary) }

  context '#substrings' do
    let(:dictionary) do
      [
        "below",
        "down",
        "go",
        "going",
        "horn",
        "how",
        "howdy",
        "it",
        "i",
        "low",
        "own",
        "part",
        "partner",
        "sit"
      ]
    end

    context 'when the first argument is a word' do
      let(:sentence) { 'below' }

      it 'returns a hash listing each substring found and how many times was found' do
        expect(subject.substrings).to eq({ "below" => 1, "low" => 1 })
      end
    end

    context 'when the first argument is a sentence' do
      let(:sentence) { "Howdy partner, sit down! How's it going?" }

      it 'returns a hash listing each substring found and how many times was found' do
        expect(subject.substrings).to eq(
          {
           "down" => 1,
           "go" => 1,
           "going" => 1,
           "how" => 2,
           "howdy" => 1,
           "it" => 2,
           "i" => 3,
           "own" => 1,
           "part" => 1,
           "partner" => 1,
           "sit" => 1
          }
        )
      end
    end
  end
end
