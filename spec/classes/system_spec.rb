#!/usr/bin/env rspec

require 'spec_helper'

describe 'env::system' do
  
  it { should contain_class 'env::system' }

  it 'should create /etc/profile.d' do
    should contain_file('/etc/profile.d').with({
      'ensure' => 'directory',
    })
  end

  it 'should create /etc/profile.d/hist_timestamp.sh' do
    should contain_file('/etc/profile.d/hist_timestamp.sh').with({
      'ensure' => 'present',
    })
  end

end
