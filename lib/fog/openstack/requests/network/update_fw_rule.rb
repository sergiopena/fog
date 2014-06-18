module Fog
  module Network
    class OpenStack
      class Real
        def update_fw_rule(rule_id, options = {})
          data = { 'firewall_rule' => {} }

          vanilla_options = [ :tenant_id , :name , :description , :source_ip_address , :source_port , :destination_ip_address , :destination_port, :name , :protocol  ]
          vanilla_options.select{ |o| options.key?(o) }.each do |key|
            data['firewall_rule'][key] = options[key]
          end

          request(
            :body    => Fog::JSON.encode(data),
            :expects => 200,
            :method  => 'PUT',
            :path    => "fw/firewall_rules/#{rule_id}"
          )
        end
      end

      class Mock
        def update_fw_rule(rule, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
