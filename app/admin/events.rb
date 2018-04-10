ActiveAdmin.register Event do
  menu parent: "대나무숲관리"
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  permit_params :title,:content, :image
  index do
    selectable_column
    id_column
    column :title
    column :image do |obj|
      image_tag obj.image.url, class: "thumb" if obj.image_data?
    end
    column :content
    actions
  end
  form do |f|
    f.inputs do
      f.input :title
      f.input :content
      # f.inputs "Upload" do
        f.input :image, required: true, as: :file
      # end
    end
    f.actions
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
