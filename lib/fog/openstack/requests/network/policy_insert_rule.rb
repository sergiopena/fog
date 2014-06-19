module Fog
  module Network
    class OpenStack
      class Real
        def policy_insert_rule(policy_id, rule_id, options = {})
          data = {
            'firewall_rule_id' => rule_id
          }

          vanilla_options = [:insert_before, :insert_after]
          vanilla_options.reject{ |o| options[o].nil? }.each do |key|
            data[key] = options[key]
          end

          request(
            :body    => Fog::JSON.encode(data),
            :expects => [200],
            :method  => 'PUT',
            :path    => "fw/firewall_policies/#{policy_id}/insert_rule"
          )
        end
      end

      class Mock
        def policy_insert_rule(policy_id, rule_id, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
