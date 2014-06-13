module Fog
  module Network
    class OpenStack
      class Real
        def get_fw_policy(pol_id)
          request(
            :expects => [200],
            :method  => 'GET',
            :path    => "fw/firewall_policies/#{pol_id}"
          )
        end
      end

      class Mock
        def get_fw_policy(pol_id)
          Fog::Mock.not_implemented         
        end
      end
    end
  end
end
