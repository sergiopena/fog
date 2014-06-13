require 'fog/core/model'

module Fog
  module Network
    class OpenStack
      class Fw < Fog::Model
        identity :id

        attribute :name
        attribute :description
        attribute :firewall_policy

        def initialize(attributes)
          prepare_service_value(attributes)
          super
        end

        def save
          requires :protocol, :action
          identity ? update : create
        end

        def create
          requires :name
          merge_attributes(service.create_fw_policy(self.name,
                                                    self.description,
                                                    self.firewall_policy,
                                                    self.attributes ).body['firewall'])
          self
        end

        def update
          # THis shit is not done at all

          requires :protocol, :action
          merge_attributes(service.create_fw_rule(self.name,
                                                    self.description,
                                                    self.source_ip_address,
                                                    self.source_port,
                                                    self.destination_ip_address,
                                                    self.destination_port,
                                                    self.protocol,
                                                    self.action,
                                                    self.attributes).body['firewall-rule'])
          self
        end

        def destroy
          requires :id
          service.delete_fw_rule(self.id)
          true
        end
      end
    end
  end
end
