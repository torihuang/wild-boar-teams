class MasterPassesController < ApplicationController

  def edit
    @pass = MasterPass.new
  end

  def update
    @user = User.find_by(role: "admin")
    @original_pass = MasterPass.first
    if @original_pass.authenticate(params[:master_pass][:old_password])
      @new_pass = MasterPass.new(password: params[:master_pass][:password], password_confirmation: 'nomatch')
      @new_pass.password_confirmation = (params[:master_pass][:confirm_password])
      if @new_pass.save
        @original_pass.update(password: params[:master_pass][:password])
        @new_pass.destroy
        redirect_to @user
      else
        @errors = @new_pass.errors.full_messages
        render 'edit'
      end
    else
      @errors = ["Invalid Master Password"]
      render 'edit'
    end
  end

end
