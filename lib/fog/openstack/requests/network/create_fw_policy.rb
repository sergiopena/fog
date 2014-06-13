module Fog
  module Network
    class OpenStack
      class Real
        def create_fw_policy(name, description, options = {})
          data = {
            'firewall_policy' => {
              'name'          => name,
              'description'   => options[:description]
            }
          }

          vanilla_options = [ :audited, :firewall_rules, :shared, :tenant_id  ]
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
        def create_fw_policy(name, description, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
