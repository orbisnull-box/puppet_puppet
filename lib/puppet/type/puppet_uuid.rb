Puppet::Type.newtype(:puppet_uuid) do
  @doc = "create uuid for certname"
  
  ensurable

  newparam(:filename, :namevar => true) do
    desc "puppet config file path"
  end


  newproperty(:uuid) do
    desc "uuid for certname"
  end


end
