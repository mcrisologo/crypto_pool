# frozen_string_literal: true

ActiveAdmin.register User do
  permit_params :name, :email

  index do
    selectable_column
    id_column
    column :name
    column :email
    actions
  end
end
