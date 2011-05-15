module GadgetsHelper
  require 'net/ssh'
  def hgc_exec(cmd)
    sgeroot = '/home/geadmin/N1GE/'
    sgebin = "#{sgeroot}/bin/lx24-amd64"
    sgeenv = "export SGE_ROOT=#{sgeroot} PATH=#{sgebin}:$PATH"
    cmd = [sgeenv, cmd].join(';')
    result  = nil
    Net::SSH.start('gw.hgc.jp','chd1') do |ssh|
      result = ssh.exec!(cmd)
    end
    return result
  end
end
