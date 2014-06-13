require 'fog/core/model'

module Fog
  module Network
    class OpenStack
      class FwRule < Fog::Model
        identity :id

        attribute :name
        attribute :description
        attribute :source_ip_address
        attribute :source_port
        attribute :destination_ip_address
        attribute :destination_port
        attribute :protocol
        attribute :action

        def initialize(attributes)
          prepare_service_value(attributes)
          super
        end

        def save
          requires :protocol, :action
          identity ? update : create
        end

        def create
          requires :protocol, :action
          merge_attributes(service.create_fw_rule(self.name,
                                                    self.description,
                                                    self.source_ip_address,
                                                    self.source_port,
                                                    self.destination_ip_address,
                                                    self.destination_port,
                                                    self.protocol,
                                                    self.action,
                                                    self.attributes ).body['firewall-rule'])
          self
        end

        def update
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
