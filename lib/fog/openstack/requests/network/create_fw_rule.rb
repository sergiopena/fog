module Fog
  module Network
    class OpenStack
      class Real
        def create_fw_rule(protocol, action, options = {})
          data = {
            'firewall_rule' => {
              'protocol'      => protocol,
              'action'        => action 
            }
          }

          vanilla_options = [ :tenant_id , :name , :description , :source_ip_address , :source_port , :destination_ip_address , :destination_port  ]
          vanilla_options.reject{ |o| options[o].nil? }.each do |key|
            data['firewall_rule'][key] = options[key]
          end

          request(
            :body    => Fog::JSON.encode(data),
            :expects => [201],
            :method  => 'POST',
            :path    => 'fw/firewall_rules'
          )
        end
      end

      class Mock
        def create_fw_rule(protocol, action, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
