# frozen_string_literal: true

ActiveAdmin.register Accounts::Address do
  menu parent: 'Account', label: 'Address'
  permit_params :type, :user_id, :name, :address

  scope 'All', default: true do |f|
    f
  end

  scope 'Ethereum' do |f|
    f.where(type: 'Accounts::Ethereum')
  end

  index do
    selectable_column
    id_column
    column :user_id
    column :name
    column :address
    actions
  end

  form do |f|
    f.inputs 'Address Details' do
      f.semantic_errors
      f.input :type, as: :select, collection: Accounts::Address.type.values
      f.input :user_id
      f.input :name
      f.input :address
    end
    f.actions
  end
end
