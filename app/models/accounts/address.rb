# frozen_string_literal: true

# == Schema Information
#
# Table name: addresses
#
#  id         :bigint(8)        not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  type       :string
#  user_id    :bigint(8)
#  name       :string
#  address    :string
#
# Indexes
#
#  index_addresses_on_user_id  (user_id)
#

module Accounts
  class Address < ApplicationRecord
    include Grape::Entity::DSL

    entity :id, :type, :user_id, :name, :address,
           :created_at, :updated_at

    has_paper_trail

    belongs_to :user
  end
end
