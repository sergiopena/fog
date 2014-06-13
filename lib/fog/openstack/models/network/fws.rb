require 'fog/core/collection'
require 'fog/openstack/models/network/fw'

module Fog
  module Network
    class OpenStack
      class Fws < Fog::Collection
        attribute :filters

        model Fog::Network::OpenStack::Fw

        def initialize(attributes)
          self.filters ||= {}
          super
        end

        def all(filters = filters)
          self.filters = filters
          load(service.list_firewalls(filters).body['firewalls'])
        end

        def get(firewall_id)
          if firewall = service.get_firewall(firewall_id).body['firewall']
            new(firewall)
          end
        rescue Fog::Network::OpenStack::NotFound
          nil
        end
      end
    end
  end
end
