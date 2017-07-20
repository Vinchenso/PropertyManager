ActiveAdmin.register Property do
  permit_params :name
  config.create_another = true

  menu priority: 4
end
