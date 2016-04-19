class MasterPassesController < ApplicationController

  def edit
    @pass = MasterPass.new
  end

  def update
    @user = User.find_by(params[:id])
    @pass = MasterPass.find_by(password: params[:master_pass][:old_password])
    @pass.password = params[:master_pass][:password]
    @pass.password_confirmation = params[:master_pass][:confirm_password]
    if @pass.save
      @pass.update(password: params[:master_pass][:password])
    else
      @errors = @pass.errors
      render 'edit'
    end
  end

end
