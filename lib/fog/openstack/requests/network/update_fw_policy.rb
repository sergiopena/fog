module Fog
  module Network
    class OpenStack
      class Real
        def update_fw_policy(pol_id, options = {})
          data = { 'firewall_policy' => {} }

          vanilla_options = [:audited, :description, :firewall_rules, :name, :shared ]
          vanilla_options.select{ |o| options.key?(o) }.each do |key|
            data['firewall_policy'][key] = options[key]
          end

          request(
            :body    => Fog::JSON.encode(data),
            :expects => 200,
            :method  => 'PUT',
            :path    => "fw/firewall_policies/#{pol_id}"
          )
        end
      end

      class Mock
        def update_fw_policy(pol_id, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
