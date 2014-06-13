module Fog
  module Network
    class OpenStack
      class Real
        def list_fw_policies(filters = {})
          request(
            :expects => 200,
            :method  => 'GET',
            :path    => '/fw/firewall_policies',
            :query   => filters
          )
        end
      end

      class Mock
        def list_fw_policies(filters = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
