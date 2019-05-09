require 'spec_helper_acceptance'
require_relative './version.rb'

describe 'xinetd class' do

  context 'basic setup' do
    # Using puppet_apply as a helper
    it 'should work with no errors' do
      pp = <<-EOF

      class { 'xinetd': }

      xinetd::daemon { 'tftp':
        description => 'TFTP daemon',
        protocol    => 'udp',
        user        => 'root',
        server      => '/usr/sbin/in.tftpd',
        server_args => '-c -v -u tftp -p -U 117 -s /tftpdata',
        per_source  => '11',
        max_cps     => '100',
        cps_bantime => '2',
        flags       => 'IPv4',
      }

      EOF

      # Run it twice and test for idempotency
      expect(apply_manifest(pp).exit_code).to_not eq(1)
      expect(apply_manifest(pp).exit_code).to eq(0)
    end

    describe file('/etc/xinetd.d/tftp') do
      it { should be_file }
      its(:content) { should match 'TFTP daemon' }
    end

  end
end
