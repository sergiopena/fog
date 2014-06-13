module Fog
  module Network
    class OpenStack
      class Real
        def get_fw_rule(fw_rule_id)
          request(
            :expects => [200],
            :method  => 'GET',
            :path    => "fw/firewall_rules/#{fw_rule_id}"
          )
        end
      end

      class Mock
        def get_fw_rule(fw_rule_id)
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
