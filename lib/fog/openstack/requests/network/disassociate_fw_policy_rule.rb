module Fog
  module Network
    class OpenStack
      class Real
        def disassociate_fw_policy_rule(policy_id, rule_id)
          request(
            :expects  => [200],
            :method   => 'PUT',
            :path     => "fw/firewall_policies/#{policy_id}/remove_rule"
          )
        end
      end

      class Mock
        def disassociate_fw_policy_rule(policy_id, rule_id)
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
