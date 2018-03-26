ActiveAdmin.register Submission do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :assignment,:user,:content, :image_data, :url
  index do
    selectable_column
    id_column
    column :assignment
    column :user
    column :image do |obj|
      image_tag obj.image.url, class: "thumb" if obj.image_data?
    end
    column :url
    actions
  end
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

end
