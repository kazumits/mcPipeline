module GadgetsHelper
  require 'net/ssh'
  require 'rexml/document'
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

  def getClusterInfo
	xml = self.hgc_exec('qstat -g c -xml')
	doc = REXML::Document.new xml
	result = doc.elements['/job_info'].elements.map do |x|
      Hash[x.elements.map {|y| [y.name, y.get_text.to_s] }]
	end
    return result
  end

  def getQueueInfo
	xml = self.hgc_exec('qstat -xml')
	doc = REXML::Document.new xml
	result = doc.elements['/job_info'].elements.map do |x|
      x.elements.map {|y| Hash[y.elements.map {|z| [z.name, z.get_text]}]}
	end
    return result.flatten
  end
end
