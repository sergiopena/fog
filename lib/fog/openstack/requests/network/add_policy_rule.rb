module Fog
  module Network
    class OpenStack
      class Real
        def add_policy_rule(policy_id, rule_id, options = {})
          data = {
              'firewall_rule_id' => rule_id,
          }

          request(
            :body     => Fog::JSON.encode(data),
            :expects  => [200],
            :method   => 'PUT',
            :path     => "fw/firewall_policies/#{policy_id}/insert_rule"
          )
        end
      end

      class Mock
        def add_policy_rule(policy_id, rule_id, options = {})
          Fog::Mock.not_implemented  
        end
      end
    end
  end
end

