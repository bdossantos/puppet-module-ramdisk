require 'spec_helper'

describe 'ramdisk', :type => :define do
  let(:title) { 'ramdisk' }
  let(:facts) { {:kernelmajversion => '2.6'} }
  let(:params) do {
      :mount  => 'mounted',
      :path   => '/var/lib/php5',
      :size   => '128M',
      :mode   => '1733',
      :owner  => 'root',
      :group  => 'root',
      :atboot => true,
    }
  end

  it do
    should contain_file('/var/lib/php5').with({
      'ensure'  => 'directory',
      'owner'   => 'root',
      'group'   => 'root',
      'mode'    => '1733',
    })
  end

  it do
    should contain_mount('/var/lib/php5').with({
      'ensure'  => 'mounted',
      'device'  => 'tmpfs',
      'fstype'  => 'tmpfs',
      'options' => "size=128M,mode=1733,uid=root,gid=root",
      'atboot'  => true,
    })
  end
end
