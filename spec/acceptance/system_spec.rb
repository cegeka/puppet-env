require 'spec_helper_acceptance'

describe 'env' do

  describe 'running puppet code' do
    it 'should work with no errors' do
      pp = <<-EOS
        include env::system 
      EOS

      # Run it twice and test for idempotency
      apply_manifest(pp, :catch_failures => true)
      apply_manifest(pp, :catch_changes => true)
    end

    describe file '/etc/profile.d/bash_hist.sh' do
      it { is_expected.to be_file }
      its(:content) { should match /HISTTIMEFORMAT/ }
    end
    
    describe file '/etc/profile.d/cegekaci.sh' do
      it { is_expected.to be_file }
      its(:content) { should match /CEGEKACI/ }
    end
  end
end
