ActiveAdmin.register_page "Dashboard" do
  content title: proc{ I18n.t("active_admin.dashboard") } do

    panel "Payments Schedule this month" do
      table_for Property.all.order('id desc') do
        column :name
        column :tenant 
        column :agent {|p| p.agent unless p.agent.nil?}
        column :payments_recieved_this_month do |property|
          link_to property.payments.this_month.sum(:amount),
            admin_payments_path(q: { tenant_id_eq: property.tenant }, scope: :this_month)
        end
      end
    end

    panel "Total Recieved" do
      columns  do
        column { Payment.this_month.sum(:amount) }
      end
    end
  end

end
