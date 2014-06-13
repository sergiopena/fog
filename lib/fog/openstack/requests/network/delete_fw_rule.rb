module Fog
  module Network
    class OpenStack
      class Real
        def delete_fw_rule(firewall_id)
          request(
            :expects => 204,
            :method  => 'DELETE',
            :path    => "fw/firewall_rules/#{firewall_id}"
          )
        end
      end

      class Mock
        def delete_fw_rule(firewall_id)
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
