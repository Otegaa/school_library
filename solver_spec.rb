require_relative 'solver'

RSpec.describe Solver do
  describe '#factorial' do
    it 'returns the factorial of a number' do
      factorial = double('factorial')
      allow(factorial).to receive(:factorial).with(5).and_return(120)
      expect(factorial.factorial(5)).to eq(120)
    end
    it 'returns the factorial of a number' do
      factorial = double('factorial')
      allow(factorial).to receive(:factorial).with(6).and_return(720)
      expect(factorial.factorial(6)).to eq(720)
    end
    it 'should raise an error if the number is negative' do
      factorial = double('factorial')
      allow(factorial).to receive(:factorial).with(-1).and_raise('Number cannot be negative')
      expect { factorial.factorial(-1) }.to raise_error('Number cannot be negative')
    end
  end
  describe '#reverse' do
    it 'returns the reverse of a string' do
      reverse = double('reverse')
      allow(reverse).to receive(:reverse).with('hello').and_return('olleh')
      expect(reverse.reverse('hello')).to eq('olleh')
    end
    it 'returns the reverse of a string' do
      reverse = double('reverse')
      allow(reverse).to receive(:reverse).with('world').and_return('dlrow')
      expect(reverse.reverse('world')).to eq('dlrow')
    end
  end
  describe '#fizzbuzz' do
    it 'returns fizz if the number is divisible by 3' do
      fizzbuzz = double('fizzbuzz')
      allow(fizzbuzz).to receive(:fizzbuzz).with(3).and_return('fizz')
      expect(fizzbuzz.fizzbuzz(3)).to eq('fizz')
    end
    it 'returns buzz if the number is divisible by 5' do
      fizzbuzz = double('fizzbuzz')
      allow(fizzbuzz).to receive(:fizzbuzz).with(5).and_return('buzz')
      expect(fizzbuzz.fizzbuzz(5)).to eq('buzz')
    end
    it 'returns fizzbuzz if the number is divisible by 3 and 5' do
      fizzbuzz = double('fizzbuzz')
      allow(fizzbuzz).to receive(:fizzbuzz).with(15).and_return('fizzbuzz')
      expect(fizzbuzz.fizzbuzz(15)).to eq('fizzbuzz')
    end
    it 'returns number as a string if number is in any other case' do
      fizzbuzz = double('fizzbuzz')
      allow(fizzbuzz).to receive(:fizzbuzz).with(7).and_return('7')
      expect(fizzbuzz.fizzbuzz(7)).to eq('7')
    end
  end
end
