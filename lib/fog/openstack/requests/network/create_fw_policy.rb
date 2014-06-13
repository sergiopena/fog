module Fog
  module Network
    class OpenStack
      class Real
        def create_fw_policy(name, options = {})
          data = {
            'firewall_policy' => {
              'name'          => name,
              'description'   => options[:description],
              'firewall_rules'=> options[:firewall_rules]
            }
          }

          vanilla_options = [ :tenant_id , :name , :description , :firewall_rules ]
          vanilla_options.reject{ |o| options[o].nil? }.each do |key|
            data['firewall_policy'][key] = options[key]
          end

          request(
            :body    => Fog::JSON.encode(data),
            :expects => [201],
            :method  => 'POST',
            :path    => 'fw/firewall_policies'
          )
        end
      end

      class Mock
        def create_fw_policy(name, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
