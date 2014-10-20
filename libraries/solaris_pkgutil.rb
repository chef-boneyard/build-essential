module BuildEssential
  module SolarisPkgutil
    def install_pkgutil
      bash 'install pkgutil' do
        user 'root'
        code <<-EOH
        pkgadd -d http://get.opencsw.org/now
        /opt/csw/bin/pkgutil -U
        EOH
        not_if { ::File.exist? '/opt/csw/bin/pkgutil' }
      end
    end

    def pkgutil_install(pkg_name)
      bash pkg_name do
        user 'root'
        code <<-EOH
        pkgutil -y --debug -i #{pkg_name}
        EOH
        not_if "pkgutil -l | grep #{pkg_name}"
      end
    end
  end
end

# Include the SolarisPkgutil module into the main recipe DSL
Chef::Recipe.send(:include, BuildEssential::SolarisPkgutil)
