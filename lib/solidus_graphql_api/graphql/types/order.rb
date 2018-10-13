require_relative 'line_item'
module Spree
  module GraphQL
    module Types
      class Order < BaseObject
        graphql_name 'Order'
        global_id_field :id

        field :id, ID, null: false
        field :number, String, null: false
        field :email, String, null: false
        field :total, Float, null: false
        field :special_instructions, String, null: true
        field :state, String, null: false
        field :guest_token, String, null: false
        field :line_items, [LineItem], null: true, resolve: LineItemResolver::ByOrder
        field :payments, [Payment], null: true, resolve: PaymentsResolver::ByOrderId
        field :bill_address, Address, null: true, resolve: AddressResolver::ByBillId
        field :ship_address, Address, null: true, resolve: AddressResolver::ByShipId
      end
    end
  end
end
