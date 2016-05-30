class UsersController < ApplicationController
	before_action :authenticate_client!
	before_action :find_user, only: [:show, :edit , :update , :destroy]

	def index
		@users = User.where(["name LIKE ?", "%#{params[:search]}%"])
		@payments = Payment.all
	end

	def show
		@user = User.find(params[:id])
		@pays = @user.payments
		@payments = Payment.all
		@groups = Group.all
	end

	def new
		@user = User.new
	end

	def add_payment
    user = User.find(params[:id])
    payment = Payment.find(params[:payment_id])

    user.payments << payment

    redirect_to :back, notice: "#{payment.name} foi pago!"
  	end

	def remove_group
		user = User.find(params[:id])

		user.group_id = nil

		user.save

		redirect_to :back, notice: 'Usuário removido do grupo!'
	end

	def create
		@user = User.new (user_params)
		@user.cpf = CPF.new(user_params[:cpf]).formatted
			if @user.save
				UserMailer.warnings(@user).deliver_now
				redirect_to users_path
			else
				render 'new'
			end
	end

	def edit
	end

	def update
		if @user.update(user_params)
			redirect_to user_path(@user)
		else
			render 'edit'
		end
	end



	def destroy
		@user.destroy
		redirect_to users_path
	end

	private 
		def user_params
			params.require(:user).permit(:name, :cpf, :email, :matricula, :idade)
		end

		def find_user
			@user = User.find(params[:id])
		end
end
