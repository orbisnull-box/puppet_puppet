Puppet::Type.type(:puppet_uuid).provide(:ruby) do
  require 'puppet/util/inifile'
    
  commands :cat => 'cat'


  def exists?
    filename = resource[:filename]
    if File.file?(filename) == false
      warning("file '#{file}' not found")
      return false
    end
    ini_file  = Puppet::Util::IniConfig::PhysicalFile.new(filename)
    ini_file.read()
    if (agent = ini_file.get_section('agent'))
      if (certname = agent['certname'])
          certname = certname.strip
          debug("uuid (certname): '#{certname}'")
          return true
      else
        warning('certname not found')
      end
    else
      warning('agent section not found')
    end
    return false
  end

  def destroy
    warning("Destroy not implemented")
  end

  def create
    uuid = cat(['/proc/sys/kernel/random/uuid']).strip
    debug("new certname: '#{uuid}'")
    
    filename = resource[:filename]
    ini_file  = Puppet::Util::IniConfig::PhysicalFile.new(filename)
    if File.file?(filename) == true
      ini_file.read()
    end
    
    if agent = ini_file.get_section('agent')
      agent['certname']=uuid
    else 
      agent = Puppet::Util::IniConfig::Section.new('agent', filename)
      
      ini_file.contents << agent
      agent['certname']=uuid
    end
    ini_file.store
    info("set new certname '#{uuid}'")
  end
end
