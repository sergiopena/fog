module Fog
  module Network
    class OpenStack
      class Real
        def get_firewall(firewall_id)
          request(
            :expects => [200],
            :method  => 'GET',
            :path    => "fw/firewalls/#{firewall_id}"
          )
        end
      end

      class Mock
        def get_firewall(firewall_id)
          Fog::Mock.not_implemented         
        end
      end
    end
  end
end
