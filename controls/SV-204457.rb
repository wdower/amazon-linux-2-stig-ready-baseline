control 'AMZL-02-720240' do
  title 'The Amazon Linux 2 operating system must define default permissions for all authenticated users
    in such a way that the user can only read and modify their own files.'
  desc 'Setting the most restrictive default permissions ensures that when new accounts are created, they do not
    have unnecessary access.'
  desc 'check', 'Verify the operating system defines default permissions for all authenticated users in such a way
    that the user can only read and modify their own files.
    Check for the value of the "UMASK" parameter in "/etc/login.defs" file with the following command:
    Note: If the value of the "UMASK" parameter is set to "000" in "/etc/login.defs" file, the Severity is raised to a
    CAT I.
    # grep -i umask /etc/login.defs
    UMASK  077
    If the value for the "UMASK" parameter is not "077", or the "UMASK" parameter is missing or is commented out, this
    is a finding.'
  desc 'fix', 'Configure the operating system to define default permissions for all authenticated users in such a way
    that the user can only read and modify their own files.
    Add or edit the line for the "UMASK" parameter in "/etc/login.defs" file to "077":
    UMASK  077'
  impact 0.5
  tag legacy: ['SV-86619', 'V-71995']
  tag severity: 'medium'
  tag gtitle: 'SRG-OS-000480-GPOS-00228'
  tag gid: 'V-204457'
  tag rid: 'AMZL-02-720240r603261_rule'
  tag stig_id: 'AMZL-02-720240'
  tag fix_id: 'F-4581r88564_fix'
  tag cci: ['CCI-000366']
  tag nist: ['CM-6 b']
  tag subsystems: ['login_defs']
  tag 'host'
  tag 'container'

  if login_defs.read_params['UMASK'].eql?('000')
    impact 0.5
  else
    impact 0.5
  end
  describe login_defs do
    its('UMASK') { should eq '077' }
  end
end
