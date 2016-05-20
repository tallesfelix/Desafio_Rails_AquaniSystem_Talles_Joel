class User < ActiveRecord::Base
	belongs_to :group

	validate :cpf_must_be_valid
	def cpf_must_be_valid
	  errors.add(:cpf, 'CPF deve ser válido') unless CPF.new(cpf).valid?
	end

	validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, :message => "Email não é valido"
end
