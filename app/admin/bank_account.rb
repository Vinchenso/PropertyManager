ActiveAdmin.register BankAccount do
  permit_params :name, :institution, :account_type, :account_klass,
    :account_number, :spreadsheet_index
end
