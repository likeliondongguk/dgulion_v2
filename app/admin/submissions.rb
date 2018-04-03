ActiveAdmin.register Submission do
menu parent: "과제관리"
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :assignment_id,:user_id,:content, :image_data, :url

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
  show do
    attributes_table do
      row :assignment
      row :image do |ad|
        image_tag ad.image.url, class: "big" if ad.image_data?
      end
    end
    panel '댓글들' do
      submission.scomments.each do |f|
        attributes_table_for f do
          rows :user,:body
        end
      end
    end
    div do
      form_for [:admin, resource, resource.scomments.build], builder: ActiveAdmin::FormBuilder do |f|
        f.inputs :body
        # f.inputs :scomments do
        #   # f.input :title
        #   f.input :body
        # end
        f.actions
      end
    end
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
