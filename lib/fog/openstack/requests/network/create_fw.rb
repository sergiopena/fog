module Fog
  module Network
    class OpenStack
      class Real
        def create_fw(name, options = {})
          data = {
            'firewall' => {
              'name'          => name,
              'description'   => options[:description],
              'firewall_policy_id'     => options[:firewall_policy_id]
            }
          }

          vanilla_options = [ :tenant_id , :name , :description , :firewall_policy_id ]
          vanilla_options.reject{ |o| options[o].nil? }.each do |key|
            data['firewall'][key] = options[key]
          end

          request(
            :body    => Fog::JSON.encode(data),
            :expects => [201],
            :method  => 'POST',
            :path    => 'fw/firewalls'
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
