module Fog
  module Network
    class OpenStack
      class Real
        def delete_fw_policy(pol_id)
          request(
            :expects  => 204,
            :method   => 'DELETE',
            :path     => "fw/firewall_policies/#{pol_id}"
          )
        end
      end

      class Mock
        def delete_fw_policy(pol_id)
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
