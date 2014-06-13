module Fog
  module Network
    class OpenStack
      class Real
        def list_fw_rules(filters = {})
          request(
            :expects => 200,
            :method  => 'GET',
            :path    => '/fw/firewall_rules',
            :query   => filters
          )
        end
      end

      class Mock
        def list_routers(filters = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
