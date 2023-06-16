class RegistrationsController < Devise::RegistrationsController
    # Seu código personalizado aqui
private

    def sign_up_params
        params.require(:user).permit(:email, :password, :password_confirmation, :name)
    end
end