# encoding: utf-8
# author: Alex Pop
#
# change a few Windows registry keys for testing purposes

# rule 'windows-audit-103'
# title 'Configure System Event Log (System)'
registry_key 'HKLM\Software\Policies\Microsoft\Windows\EventLog\System' do
  values [{ name: 'MaxSize', type: :dword, data: 67_108_864 }]
  recursive true
  action :create
end

# rule 'windows-base-101'
# title 'Safe DLL Search Mode is Enabled'
registry_key 'HKLM\System\CurrentControlSet\Control\Session Manager' do
  values [{ name: 'SafeDllSearchMode', type: :dword, data: 1 }]
  recursive true
  action :create
end

# rule 'windows-base-103'
# title 'All Shares are Configured to Prevent Anonymous Access'
registry_key 'HKLM\System\CurrentControlSet\Services\LanManServer\Parameters' do
  values [{ name: 'NullSessionShares', type: :multi_string, data: [] }]
  recursive true
  action :create
end

# rule 'windows-ie-101'
# title 'IE 64-bit tab'
registry_key 'HKLM\Software\Policies\Microsoft\Internet Explorer\Main' do
  values [{ name: 'Isolation64Bit', type: :dword, data: 1 }]
  recursive true
  action :create
end

# rule 'windows-rdp-101'
# title 'Strong Encryption for Windows Remote Desktop Required'
registry_key 'HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services' do
  values [{ name: 'MinEncryptionLevel', type: :dword, data: 3 }]
  recursive true
  action :create
end
