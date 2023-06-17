class UsersController < ApplicationController
    before_action :authenticate_user!, only: [:update]
  
    def edit
      @user = current_user
    end
  
    def update
      @user = current_user
      if @user.update(user_params)
        redirect_to root_path, notice: "Cadastro atualizado com sucesso."
      else
        render :edit
      end
    end
  
    private
  
    def user_params
      params.require(:user).permit(:name, :cpf, :birthdate, :marital_status, :gender)
    end
  end
  