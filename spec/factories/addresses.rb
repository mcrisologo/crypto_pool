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

FactoryBot.define do
  factory :address, class: Accounts::Address do
    user { create(:user) }
    name { Faker::Name.first_name }
    address { Faker::Blockchain::Ethereum.address }

    trait :ethereum do
      type { 'Accounts::Ethereum' }
    end
  end
end
