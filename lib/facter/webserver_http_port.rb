Facter.add(:webserver_http_port) do
  confine kernel: ['Linux', 'windows']
  setcode do
    port = nil

    if Facter.value(:kernel) == 'Linux'
      apache_conf = '/etc/apache2/ports.conf'
      if File.exist?(apache_conf)
        File.readlines(apache_conf).each do |line|
          line.strip!
          if line =~ %r{^Listen\s+(\d+)}
            port = Regexp.last_match(1)
            break
          end
        end
      end

    elsif Facter.value(:kernel) == 'windows'
      require 'win32/registry'
      begin
        result = `%x[powershell.exe -Command "Import-Module WebAdministration; (Get-WebBinding -Protocol 'http').bindingInformation"]`
        match = result.match(/:(\d+):/)
        port = match[1] if match
      rescue
        port = nil
      end
    end

    port
  end
end
