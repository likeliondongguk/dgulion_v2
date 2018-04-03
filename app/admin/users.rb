ActiveAdmin.register User do
  menu parent: "회원관리"
  scope :default
  scope :admin
  permit_params :name, :grade, :email, :image, :desc, :password
    index do
      selectable_column
      id_column
      column :email
      column :name
      column :image do |obj|
        image_tag obj.image.url, class: "thumb" if obj.image_data?
      end
      column :grade
      column :desc
      actions
    end

    filter :email
    filter :name
    filter :grade

    form do |f|
      f.inputs do
        f.input :email
        f.input :name
        f.input :grade
        f.inputs "Upload" do
          f.input :image, required: true, as: :file
        end
        f.input :desc
        f.input :password
      end
      f.actions
    end
     #admin으로 변환
     action_item :admin, only: :show do
        link_to "admin", admin_admin_user_path(user), method: :put unless user.has_role? :admin
     end
     member_action :admin, method: :put do
        user = User.find(params[:id])
        roles=user.roles.map{|v| v.name.to_sym}
        roles.each{|r| user.remove_role r}
        user.add_role :admin
        redirect_to admin_user_path(user)
     end
     #default로 변환
     action_item :default, only: :show do
        link_to "default", default_admin_user_path(user), method: :put unless user.has_role? :default
     end
     member_action :default, method: :put do
        user = User.find(params[:id])
        roles=user.roles.map{|v| v.name.to_sym}
        roles.each{|r| user.remove_role r}
        user.add_role :default
        redirect_to admin_user_path(user)
     end
end
