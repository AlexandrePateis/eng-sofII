class RegistrationsController < Devise::RegistrationsController
 before_action :authenticate_user!

def edit_additional_info
    @user = current_user
end
  
def edit
end

def update
    if current_user.update(sign_up_params)
      bypass_sign_in(current_user) # Evita que o usuário seja desconectado
      redirect_to root_path, notice: 'Dados atualizados com sucesso.'
    else
      render :edit
    end
  end
  

  # Redireciona o usuário para a página de perfil do usuário após a atualização
private

    def sign_up_params
        params.require(:user).permit(:email, :password, :password_confirmation, :name, :cpf, :birthdate, :marital_status, :gender)
    end

end