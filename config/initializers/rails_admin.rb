RailsAdmin.config do |config|
  config.authorize_with do
    redirect_to main_app.root_path unless current_user.admin == true
  end
  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  config.excluded_models = ["AdminUser"]

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app
  end

  config.model 'User' do
    navigation_icon 'icon-user'
      list do
        field :full_name
        field :email
        field :phone_number
        field :admin
      end
      exclude_fields :current_sign_in_at, :last_sign_in_ip, :current_sign_in_ip, :last_sign_in_at, :sign_in_count
  end

  config.model 'Workout' do
    list do
      field :name
      field :workout_type
      field :muscle_worked
      field :difficulty
    end
    edit do
      field :name
    end
    exclude_fields :workout_plan_id, :workout_plans
end
