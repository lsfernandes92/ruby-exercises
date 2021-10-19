require 'spec_helper'
require_relative '../caesar_cipher'

RSpec.describe 'Cryptography basic project' do
  subject { CaesarCipher }

  context 'when encode with positive number' do
    it 'shifts the letters' do
      expect(subject.encode('What a string!', 5)).to eq('Bmfy f xywnsl!')
    end
  end

  context 'when encode with negative number' do
    it 'shifts the letters' do
      expect(subject.encode('What a string!', -5)).to eq('Rcvo v nomdib!')
    end
  end

  context 'with invalid arguments' do
    context 'when is not a string to be encode' do
      it 'should raise error' do
        expect {
          subject.encode(1, -5)
        }.to raise_error('Please ensure to input a String to be encode')
      end
    end

    context 'when shift factor is not an Integer' do
      it 'should raise error' do
        expect {
          subject.encode('What a string!', '')
        }.to raise_error('Please ensure that shift factor is an Integer')
      end
    end
  end
end
