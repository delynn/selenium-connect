# Encoding: utf-8

require 'spec_helper'
require 'selenium_connect/runner/runner_factory'

describe SeleniumConnect::Runner::RunnerFactory do
  let(:factory) { SeleniumConnect::Runner::RunnerFactory }

  it 'should respond to build' do
    factory.should respond_to :build
  end

  it 'should raise an error for unknown runner' do
    config = double 'SeleniumConnect::Config::Runner::Local'
    config.should_receive(:type).and_return('bad_runner')
    expect do
      factory.build config
    end.to raise_error(ArgumentError, 'The runner "bad_runner" is unknown.')
  end

end